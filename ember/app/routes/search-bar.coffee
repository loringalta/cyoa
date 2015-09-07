`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

SearchBarRoute = Ember.Route.extend
  controllerName: 'search-bar'
  model: (params) ->
    data = this.store.findAll('foodItem')
    return data
  afterModel: (food) ->
    id = 0
    for item of food.store.typeMaps
      do (item) ->
        id++
        brick = "<div class='brick large-#{id}'><a class = 'delete-widget' href = '#'>x</a></div>"
        return $('.gridly').append(brick)

`export default SearchBarRoute`
