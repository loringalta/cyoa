`import Ember from 'ember'`

LoginController =  Ember.Controller.extend
  actions: 
  	logIn: -> 
  		controller = this
  		return Ember.$.post('/users/sign_in.json', { user:
  				email: @get('email')
  				password: @get('password')
  				}, ((data) ->
  					location.reload()
  					return
  				), 'json').fail ->
  					alert 'sign in failed!'
  					return

`export default LoginController`