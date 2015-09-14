`import Devise from 'simple-auth-devise/authenticators/devise';`

CustomAuthenticator = Devise.extend
  authenticate: (credentials) ->
    new Ember.RSVP.Promise((resolve, reject) =>
      data = {}
      data[@resourceName] =
        email: credentials.identification
        password: credentials.password
      @makeRequest(data).then ((response) =>
        Ember.run =>
          store = @container.lookup('store:main')
          store.getById('user', response.user.id) || store.createRecord('user', response.user)
          resolve
            id:        response.user.id
            email:     response.user.username
            token:     response.user.token
      ), (xhr, status, error) ->
        Ember.run ->
          reject xhr.responseJSON || xhr.responseText
    )

`export default CustomAuthenticator`
