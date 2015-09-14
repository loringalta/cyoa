`import Ember from 'ember'`
`import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin'`


ApplicationRoute = Ember.Route.extend ApplicationRouteMixin,
  beforeModel: (transition) ->
  	this._super.apply this, arguments
  	return this.csrf.fetchToken()    
 	model: ->
 		food = { 'food-items' :
 			{
 				id: 9064
 				num_result: 2
 				name: 'red chilis and hot pepper'
 				group: 'chili'
 				foodid: 9054
 				nutrients: []
 			}
 		}
 		this.store.pushPayload food
  #   @_super transition

  #   if @session.isAuthenticated
  #     @_populateCurrentUser()
  #     @_populateCurrentContext()
  #   else
  #     @transitionTo 'login'
  #     console.log @session.get('store')


`export default ApplicationRoute`
