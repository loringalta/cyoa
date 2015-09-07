`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

SearchBarRoute = Ember.Route.exten
  queryParams: 
    searchQuery: 
      refreshModel: true
    numberOfResults:
      refreshModel: true
  controllerName: 'search-bar'
  model: (params) ->
    data = this.store.findQuery('foodItem', params)
    return data
  afterModel: (food) ->
    id = 0
    for item of food.store.typeMaps
      do (item) ->
        id++
        brick = "<div class='brick large-#{id}'><a class = 'delete-widget' href = '#'>x</a></div>"
        return $('.gridly').append(brick)
      return
    return

`export default SearchBarRoute`
