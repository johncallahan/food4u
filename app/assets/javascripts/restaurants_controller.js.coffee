
root = global ? window

RestaurantsIndexCtrl = ($scope, $rootScope, Restaurant) ->
  $scope.restaurants = Restaurant.query()
  $scope.currentTag = ''

  $rootScope.$on 'anotherEvent', (event, args) ->
    $scope.currentTag = args

  $scope.myFilter = (tagname) ->
    (input) -> 
      if tagname == ''
        return input
      for i in input.tag_list
        if i == tagname
          return input
      false

  $scope.removeTag = () ->
    $scope.currentTag = ''

  $scope.destroy = ->
    if confirm("Are you sure?")
      original = @restaurant
      @restaurant.destroy ->
        $scope.restaurants = _.without($scope.restaurants, original)
        
RestaurantsIndexCtrl.$inject = ['$scope', '$rootScope', 'Restaurant'];

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