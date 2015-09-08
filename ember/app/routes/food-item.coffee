`import Ember from 'ember'`

FoodItemRoute = Ember.Route.extend
  queryParams: 
    searchQuery: 
      refreshModel: true
    numberOfResults:
      refreshModel: true
  controllerName: 'search-bar'
  model: (params) ->
    data = this.store.findQuery('foodItem', params)
    return data

`export default FoodItemRoute`
