`import Ember from 'ember'`
`import { moduleFor, test } from 'ember-qunit'`
`import startApp from 'food-search/tests/helpers/start-app'`

application = null
store = null

moduleFor 'controller:search-bar', {
	needs: ['controller:application']
	setup: ->
		application = startApp()
		store = application.__container__.lookup('store:main');
		return
}

test 'the action favorite adds an item to user favorites', ->
	expect(2)
	controller = @subject(
	  store: store
	)
	authenticateSession()
	food_item_name = "red chilis and hot pepper"
	controller.send 'favorite', food_item_name
	food_item_array = currentSession()
	return

test 'the action search adds food items returned from rails server to model', (assert) ->
	assert.expect(1)
	controller = @subject(
	  store: store
	)
	controller.send 'search', "red"
	count = []
	foods = controller.store.filter('foodItem', (item) ->
		return true
  ).then (users) ->
		console.log users.length
		console.log users

	return assert.equal count.length, 5
