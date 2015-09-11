`import Ember from "ember";`
`import LoginControllerMixin from "simple-auth/mixins/login-controller-mixin";`

NewController = Ember.Controller.extend(LoginControllerMixin, {
  errors: {}

  actions:
    create: ->
      @model.save().then((data) =>
        # Success
        @transitionToRoute('index')
      , (data) =>
        # Failure
        @set 'errors', data.errors
      )
})

`export default NewController;`