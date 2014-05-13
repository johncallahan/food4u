
root = global ? window

RestaurantsIndexCtrl = ($scope, $rootScope, leafletEvents, leafletData, Restaurant) ->
  markers = [ ]

  plotLocations = (rs) ->
    leafletData.getMap().then((map) ->
      for r in rs
        marker = L.marker([r.latitude,r.longitude],{icon:L.divIcon {className: 'leaflet-div-icon'}})
        map.addLayer(marker)
        markers.push(marker)
    )

  $scope.restaurants = Restaurant.query( plotLocations  )
  $scope.currentTag = ''

  $rootScope.$on 'anotherEvent', (event, tagname) ->
    $scope.currentTag = tagname
    leafletData.getMap().then((map) ->
      for m in markers
        map.removeLayer(m))
    leafletData.getMap().then((map) ->
      for r in $scope.restaurants
        if tagname == ''
          marker = L.marker([r.latitude,r.longitude],{icon:L.divIcon {className: 'leaflet-div-icon'}})
          map.addLayer(marker)
          markers.push(marker)
        else
          for i in r.tag_list
            if i == tagname
              marker = L.marker([r.latitude,r.longitude],{icon:L.divIcon {className: 'leaflet-div-icon'}})
              map.addLayer(marker)
              markers.push(marker)
    )

  $scope.myFilter = (tagname) ->
    (input) -> 
      if tagname == ''
        return input
      for i in input.tag_list
        if i == tagname
          return input
      false

  $scope.$on 'leafletDirectiveMap.click', (e) ->
    leafletData.getMap().then((map) ->
      for r in $scope.restaurants
        marker = L.marker([r.latitude,r.longitude],{icon:L.divIcon {className: 'leaflet-div-icon'}})
        map.addLayer(marker)
        markers.push(marker)
    )

  $scope.removeTag = () ->
    $scope.currentTag = ''
    $rootScope.$emit 'someEvent', "hello there"

  $scope.destroy = ->
    if confirm("Are you sure?")
      original = @restaurant
      @restaurant.destroy ->
        $scope.restaurants = _.without($scope.restaurants, original)
        
RestaurantsIndexCtrl.$inject = ['$scope', '$rootScope', 'leafletEvents', 'leafletData', 'Restaurant'];

RestaurantsCreateCtrl = ($scope, $location, Restaurant) ->
  $scope.save = ->
    Restaurant.save $scope.restaurant, (restaurant) ->
      $location.path "/restaurants/#{restaurant.id}/edit"

RestaurantsCreateCtrl.$inject = ['$scope', '$location', 'Restaurant'];

RestaurantsShowCtrl = ($scope, $location, $routeParams, Restaurant) ->
  Restaurant.get
    id: $routeParams.id
  , (restaurant) ->
    @original = restaurant
    $scope.restaurant = new Restaurant(@original)

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.restaurant.destroy ->
        $location.path "/restaurants"

RestaurantsShowCtrl.$inject = ['$scope', '$location', '$routeParams', 'Restaurant'];

RestaurantsEditCtrl = ($scope, $rootScope, $location, $routeParams, Restaurant) ->
  Restaurant.get
    id: $routeParams.id
  , (restaurant) ->
    @original = restaurant
    $scope.restaurant = new Restaurant(@original)

  $scope.isClean = ->
    console.log "[RestaurantsEditCtrl, $scope.isClean]"
    angular.equals @original, $scope.restaurant

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.restaurant.destroy ->
        $location.path "/restaurants"

  $scope.save = ->
    Restaurant.update $scope.restaurant, (restaurant) ->
      $location.path "/restaurants"
    $rootScope.$emit 'someEvent', "hello there"

RestaurantsEditCtrl.$inject = ['$scope', '$rootScope', '$location', '$routeParams', 'Restaurant'];

# exports
root.RestaurantsIndexCtrl  = RestaurantsIndexCtrl
root.RestaurantsCreateCtrl = RestaurantsCreateCtrl
root.RestaurantsShowCtrl   = RestaurantsShowCtrl
root.RestaurantsEditCtrl   = RestaurantsEditCtrl 