`import Ember from 'ember'`
`import { moduleFor, test } from 'ember-qunit'`
`import startApp from 'food-search/tests/helpers/start-app'`

application = null

module 'Integration - Login', {
  setup: ->
    application = startApp()
    store = application.__container__.lookup('store:main')
    return
  teardown: ->
    Ember.run(application, application.destroy);
}

test 'Should fail with bad password',  ->
  visit("/login").then ->
    fillIn("input#password","meow")
    fillIn("input#identification", "meowmeow")
    click("button[type='submit']")
    andThen ->
      equal(find("form h1").text(), "Login")


test "Should authenticate and then route to landing page", (assert) ->
  visit("/login").then ->
    authenticateSession()
    andThen ->
      console.log currentRouteName()
      assert.equal currentRouteName(), 'login'
