
root = global ? window

TagsIndexCtrl = ($scope, $rootScope, Tag) ->
  $scope.tags = Tag.query()
  $scope.currentTag = ''

  $rootScope.$on 'someEvent', (event, args) ->
    $scope.currentTag = ''
    $scope.tags = Tag.query()

  $scope.$watch 'currentTag', (value) ->
    console.log value
    $rootScope.$emit 'anotherEvent', value

TagsIndexCtrl.$inject = ['$scope', '$rootScope', 'Tag'];

# exports
root.TagsIndexCtrl  = TagsIndexCtrl
