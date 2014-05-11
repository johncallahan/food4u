
root = global ? window

TagsIndexCtrl = ($scope, $rootScope, Tag) ->
  $scope.tags = Tag.query()

  $rootScope.$on 'someEvent', (event, args) ->
    $scope.tags = Tag.query()

  $scope.onTagClick = (tagname) ->
    $rootScope.$emit 'anotherEvent', tagname

TagsIndexCtrl.$inject = ['$scope', '$rootScope', 'Tag'];

# exports
root.TagsIndexCtrl  = TagsIndexCtrl
