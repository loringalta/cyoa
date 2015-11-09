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

test 'Login Link is viewable', (assert) ->
  assert.expect(2)
  visit("/").then ->
    assert.equal(find('nav ul li#login a').text(), "Login")
    click('nav ul li#login a')
    andThen ->
      assert.equal currentRouteName(), 'login'
      return
      return

test 'Home Link is viewable', (assert) ->
  assert.expect(2)
  visit("/").then ->
    assert.equal(find('nav ul li#home a').text(), "Home")
    click("nav ul li#home a")
    andThen ->
      assert.equal(find('h1').text(), "I'm healthier than I have ever bean")
      return
      return

test 'User Name is viewable after sign in', (assert) ->
  assert.expect(1)
  visit('/login').fillIn('#identification', 'green@mail.com').fillIn('#password', '12345678').click("button[type='submit']").then ->
    assert.equal find('li#username').text(), "green"
    return
