`import Ember from 'ember'`
`import { moduleFor, test } from 'ember-qunit'`
`import startApp from 'food-search/tests/helpers/start-app'`

moduleFor 'controller:search-bar', {
	beforeEach: -> 
		application = startApp()
		return
}

test 'params are null when search bar is loaded', (assert) ->
  controller = @subject()
  numResults = controller.get('numberOfResults')
  searchQuery = controller.get('searchQuery')
  andThen -> 
    equal(numResults, null)
    equal(searchQuery, null)
  return

test 'params are set to inputed value when search is called', (assert) ->
	controller = @subject()
	controller.set 'numberOfResults', 4
	controller.set 'searchQuery', "apple"
	andThen -> 
	  equal(controller.get('numberOfResults'), 4)
	  equal(controller.get('searchQuery'), "apple")
  return

test 'widget should be deleted when deleteWidget is called', (assert) ->
	controller = @subject()

test 'widget with added search query should be appended to the dashboard', (assert) ->

test 'find corresponding food-item object and push onto user store', (assert) -> 
