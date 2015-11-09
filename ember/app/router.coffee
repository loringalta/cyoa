
`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @route 'users', ->
    @route 'signup'
    @route 'user',
      path: '/user/:user_id'

  @resource 'profile', { path: '/profile/:username' }
  @route 'login'
  @resource 'search-bar', ->
    @route 'food-item'

  @resource 'food-item', { path: '/food-item/:searchQuery' }

`export default Router`
