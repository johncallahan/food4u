root = global ? window

angular.module("tags", ["ngResource"]).factory "Tag", ['$resource', ($resource) ->
  Tag = $resource("/tags/:id",
    id: "@id"
  )

  Tag
]
root.angular = angular
