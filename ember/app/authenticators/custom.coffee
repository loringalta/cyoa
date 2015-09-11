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
          account = { 'account' : 
            {
              id: response.account.id
              email: response.account.email
              username: response.account.username
            }

          }
          store.getById('account', response.account.id) || store.createRecord('user', response.account)
          resolve
            id:        response.account.id
            email:     response.account.email
            token:     response.account.token
      ), (xhr, status, error) ->
        Ember.run ->
          reject xhr.responseJSON || xhr.responseText
    )

`export default CustomAuthenticator`