root = global ? window

angular.module("restaurants", ["ngResource"]).factory "Restaurant", ['$resource', ($resource) ->
  Restaurant = $resource("/restaurants/:id",
    id: "@id"
  ,
    update:
      method: "PUT"

    destroy:
      method: "DELETE"
  )
  Restaurant::destroy = (cb) ->
    Restaurant.remove
      id: @id
    , cb

  Restaurant
]
root.angular = angular
