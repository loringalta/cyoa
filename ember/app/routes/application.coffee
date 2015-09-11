`import Ember from 'ember'`
`import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin'`


ApplicationRoute = Ember.Route.extend ApplicationRouteMixin,
  beforeModel: (transition) -> 
    @_super transition

    if @session.isAuthenticated
      @_populateCurrentUser()
      @_populateCurrentContext()
    else
      @transitionTo 'login'

      this._super.apply this, arguments 
      return this.csrf.fetchToken()
  actions: 
    contextChanged: ->
      @refresh()
    error: (error, transition)->
      # Application level error redirecting.
      if error and error.status == 404
        @transitionTo '/404'
    sessionAuthenticationSucceeded: ->
      @_populateCurrentUser()
      # Manually reroute here.
    sessionAuthenticationSucceeded: ->
      @transitionTo 'index'
    sessionInvalidationSucceeded: ->
      @transitionTo 'login'

  _populateCurrentUser: ->
    """Sets the currently logged in user to `currentUser` which is
    injected into routes, controllers, and components via the
    instance-initializer current-user.
    """
    user_username = @get 'session.secure.user.username'
    @store.find('user', user_username).then (user)=>
      console.log user
      @get('currentUser').set 'content', user
      # Now that we have currentUser, set their context.
      @_populateCurrentContext()

  _populateCurrentContext: ->
    """Sets the currently logged in user's default context as the
    `currentContext` which is injected into routes, controllers, and
    components via the instance-initializer current-context.
    """
    # Check for a defaultContext and set it as context.
    defaultContext = @currentUser.get 'defaultContext.id'
    if defaultContext
      @store.find('context', defaultContext).then (context)=>
        @get('currentContext').set 'content', context

`export default ApplicationRoute`

# export default Ember.Route.extend(ApplicationRouteMixin, {
#   beforeModel: function(transition) {
#     this._super.apply(this, arguments);
#     return this.csrf.fetchToken();
#   },

 #   model() {
 #     let normFood = this.store.normalize('food-item', {
 #       type: 'food-item',
 #       id: 9064,
 #       num_result: 2,
 #       name: 'red chilis and hot pepper',
 #       group: 'chili',
 #       foodid: 9064,
 #       nutrients: []
 #     });

 #     let regFood =
 #     { 'food-items':
 #       {
 #         id: 9064,
 #         num_result: 2,
 #         name: 'red chilis and hot pepper',
 #         group: 'chili',
 #         foodid: 9064,
 #         nutrients: []
 #       }
 #     };

 #     this.store.pushPayload(regFood);
 #   }
 # })