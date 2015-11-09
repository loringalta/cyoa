`import Ember from 'ember'`

ProfileRoute = Ember.Route.extend
  model: (params, transition) ->
    return this.get('store').find('user', params.username)


`export default ProfileRoute`
