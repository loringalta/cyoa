`import DS from 'ember-data'`
`import Ember from 'ember'`

ApplicationAdapter = DS.ActiveModelAdapter.extend
  host: 'http://localhost:3000'
  namespace: 'api'
  headers: (->
    return "X-XSRF-TOKEN": Ember.get(document.cookie.match(/XSRF\-TOKEN\=([^;]*)/), "1")
    ).property().volatile()
  pathForType: (modelName) ->
    modelName = 'food-item'
    underscore = Ember.String.underscore(modelName)
    return Ember.String.pluralize(underscore)
  init: ->
    @_super()
    token = $('meta[name="csrf-token"]').attr('content')
    @headers = 'X-CSRF-Token': token

`export default ApplicationAdapter`