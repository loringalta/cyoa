`import Ember from 'ember'`
`import { moduleFor, test } from 'ember-qunit'`
`import startApp from 'food-search/tests/helpers/start-app'`

application = null

module 'Integration - Login', {
  beforeEach: ->
    application = startApp()
    return
}

test 'Login Link is viewable', (assert) ->
  visit("/").then ->
    equal(find('nav ul li#login a').text(), "Login")
    click("nav ul li#login a")
    andThen ->
      equal(find('h1').text(), "Login")

test 'Home Link is viewable', (assert) ->
  visit("/").then ->
    equal(find('nav ul li#home a').text(), "Home")
    click("nav ul li#home a")
    andThen ->
      equal(find('h1').text(), 'landing page')
