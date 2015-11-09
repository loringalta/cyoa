`import Ember from "ember"`
`import ApplicationController from "./application";`
`import LoginControllerMixin from "simple-auth/mixins/login-controller-mixin";`
`import Cookie from 'simple-auth-cookie-store/stores/cookie';`

LoginController = ApplicationController.extend(LoginControllerMixin, {
  rememberMe: false
  rememberMeChanged: (->
    console.log this
    this.get('session.store').cookieExpirationTime = this.get('rememberMe') ? 1209600 : null;
    ).observes('rememberMe')
  authenticator: 'authenticator:custom'
})

`export default LoginController`
