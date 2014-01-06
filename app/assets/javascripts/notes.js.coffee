#= require 'lib/angular'
#= require 'lib/angular-resource'

notes = angular.module('notes', ['ngResource'])

notes.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

angular.module('notes').controller "NotesCtrl", ($scope, $resource) ->
  console.log("controller loaded!")
  Note = $resource('/api/notes/:id', {id:'@id'})

  $scope.notes = Note.query()

  $scope.addNote = ->
    note = {title: $scope.title, body: $scope.body}
    new Note(note).$save()
    $scope.notes.push(note)
