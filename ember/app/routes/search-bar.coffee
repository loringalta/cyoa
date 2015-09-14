`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

SearchBarRoute = Ember.Route.extend
  beforeModel: ->
    gridly = $('.gridly').gridly(
      base: 290
      gutter: 10
      'responsive': true
    )
    return gridly
  model: (params) ->
    return this.store.all 'foodItem'

`export default SearchBarRoute`
