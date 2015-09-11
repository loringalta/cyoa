`import Ember from "ember";`
`import ApplicationController from "./application";`
`import LoginControllerMixin from "simple-auth/mixins/login-controller-mixin";`

LoginController = ApplicationController.extend(LoginControllerMixin, {
  authenticator: 'authenticator:custom'
})

`export default LoginController;`