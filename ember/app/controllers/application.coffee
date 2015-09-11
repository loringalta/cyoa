`import Ember from 'ember'`

ApplicationController = Ember.Controller.extend
  isLoading: false
  buttonTest: "Submit"
  selected: []
  init: ->
    window.Store = @store
    @_super();
  actions:
    selectItem: (item) ->
      this.get('selected').pushObject(item)
    deselectItem: (item) ->
      this.get('selected').removeObject(item)

`export default ApplicationController`
