`import Ember from 'ember'`

FoodItemView = Ember.View.extend(
	favorite: ->
		object = null
		console.log ("hello")
		console.log(@get('controller'))
		@get('controller').send("submitInController", object)
)


`export default FoodItemView`
