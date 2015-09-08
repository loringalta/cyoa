`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

SearchBarRoute = Ember.Route.extend    
  queryParams: 
    searchQuery: 
      refreshModel: true
    addQuery: 
      refreshModel: true
  controllerName: 'search-bar'
  resetController: (controller, isExiting, transition) ->
    if (isExiting)
      controller.set('searchQuery', '')
      controller.set('addQuery', '')
  model: (params) ->
    data = this.store.find('foodItem', params)
    return data

`export default SearchBarRoute`
