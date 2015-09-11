`import CustomSession from '../models/custom-session';`
`import CustomAuthenticator from '../authenticators/custom';`


AuthenticationInitializer = {
  name: 'authentication',
  before: 'simple-auth',
  initialize: (container) ->
    # register the custom session so Ember Simple Auth can find it
    container.register "session:custom", CustomSession
    # register the custom authenticator so the session can find it
    container.register "authenticator:custom", CustomAuthenticator
}

`export default AuthenticationInitializer`
