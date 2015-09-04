`import Ember from 'ember'`

FoodItemRoute = Ember.Route.extend(
  controllerName: 'food-item'
  model: ->
    return this.store.findAll('foodItem')
)

`export default FoodItemRoute`
