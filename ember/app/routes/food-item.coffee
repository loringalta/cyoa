`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

FoodItemRoute = Ember.Route.extend AuthenticatedRouteMixin,
  controllerName: 'search-bar'
  model: (params) ->
    data = this.store.findAll('foodItem')
    return data

`export default FoodItemRoute`
