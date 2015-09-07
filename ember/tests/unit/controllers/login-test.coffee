`import Ember from 'ember'`
`import { moduleFor, test } from 'ember-qunit'`
`import startApp from 'food-search/tests/helpers/start-app'`

moduleFor 'controller:login', {
  beforeEach: ->
    application = startApp()
    return
}

test 'calling authenticate authenticates a user', (assert) ->
  data = {'identification': "green@mail.com", 'password': "12345678"}
  currentSession().authenticate('simple-auth-authenticator:devise', data)
  andThen ->
      equal(find('h1').text(), 'landing page')
