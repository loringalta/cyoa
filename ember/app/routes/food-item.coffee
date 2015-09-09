`import Ember from 'ember'`

FoodItemRoute = Ember.Route.extend
  query: (params) ->
    console.log params
  model: (params) ->
    data = this.store.find('foodItem', params)
    console.log "foo-teim", data
    return data

`export default FoodItemRoute`
