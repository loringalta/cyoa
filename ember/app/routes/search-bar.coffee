`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

SearchBarRoute = Ember.Route.extend
  # queryParams:
  #   searchQuery:
  #     refreshModel: true
  #   addQuery:
  #     refreshModel: true
  model: (params) ->
    console.log "params", params
    content = [];
    content.pushObject Ember.Object.create('id': 'red')
    content.pushObject Ember.Object.create('id': 'blue')
    content.pushObject Ember.Object.create('id': 'green')
    content.pushObject Ember.Object.create('id': 'cyan')
    return content
    # data = this.store.find('foodItem', params)
    # return data

`export default SearchBarRoute`
