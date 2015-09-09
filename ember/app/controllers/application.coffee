`import Ember from 'ember'`

ApplicationController = Ember.Controller.extend
  isLoading: false
  buttonTest: "Submit"
  selected: []
  actions:
    selectItem: (item) ->
      this.get('selected').pushObject(item)
    deselectItem: (item) ->
      this.get('selected').removeObject(item)

`export default ApplicationController`
