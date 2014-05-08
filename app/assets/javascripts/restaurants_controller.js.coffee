
root = global ? window

RestaurantsIndexCtrl = ($scope, Restaurant) ->
  $scope.restaurants = Restaurant.query()

  $scope.destroy = ->
    if confirm("Are you sure?")
      original = @restaurant
      @restaurant.destroy ->
        $scope.restaurants = _.without($scope.restaurants, original)
        
RestaurantsIndexCtrl.$inject = ['$scope', 'Restaurant'];

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

RestaurantsEditCtrl = ($scope, $location, $routeParams, Restaurant) ->
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

RestaurantsEditCtrl.$inject = ['$scope', '$location', '$routeParams', 'Restaurant'];

# exports
root.RestaurantsIndexCtrl  = RestaurantsIndexCtrl
root.RestaurantsCreateCtrl = RestaurantsCreateCtrl
root.RestaurantsShowCtrl   = RestaurantsShowCtrl
root.RestaurantsEditCtrl   = RestaurantsEditCtrl 