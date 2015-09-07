`import Ember from 'ember'`

FoodItemRoute = Ember.Route.extend
  controllerName: 'search-bar'
  model: (params) ->
    data = this.store.findQuery('foodItem', params)
    return data

`export default FoodItemRoute`
