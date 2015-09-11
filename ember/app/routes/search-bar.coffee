`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

SearchBarRoute = Ember.Route.extend
  model: (params) ->
    return this.store.all 'foodItem'

`export default SearchBarRoute`
