`import Ember from 'ember'`
`import { moduleFor, test } from 'ember-qunit'`
`import startApp from 'food-search/tests/helpers/start-app'`

application = null

module 'Integration - Login', {
  beforeEach: ->
    application = startApp()
    return
}

test 'Should fail with bad password',  ->
  visit("/login").then ->
    fillIn("input#password","meow")
    fillIn("input#identification", "meowmeow")
    click("form button")

    andThen ->
      equal(find("form h1").text(), "Login")


test "Should authenticate and then route to landing page", (assert) ->
  assert.expect(1)
  visit("/login").then ->
    authenticateSession()
    andThen ->
      assert.equal(currentRouteName(), '/')
