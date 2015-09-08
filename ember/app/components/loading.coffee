`import Ember from 'ember'`


LoadingComponent = Ember.Component.extend
  classNames: ['button']
  buttonText: "Submit"
  isLoading: false
  actions: 
  	showLoading: -> 
  		if !@get('isLoading')
  			@set 'isLoading', true
  			@sendAction 'action'
  			
`export default Loading`
