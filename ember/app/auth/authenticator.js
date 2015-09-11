import Ember from 'ember';
import BaseAuthenticator from 'simple-auth/authenticators/base';

export default BaseAuthenticator.extend({

  /**
   * Authentication end-point
   */
  url: '/session',

  /**
   * Performs the authentication given a set of options
   * @param {Object} options
   * - identification: username
   * - password
   * @override
   * @return Ember.RSVP.Promise
   */
  authenticate: function(options) {
    var credentials = {
      username: options.identification,
      password: options.password
    };

    // make a request to the corresponding service in order to get the user authorized
    return new Ember.RSVP.Promise(function(resolve, reject) {
      return this.request(credentials).then(resolve, reject);
    }.bind(this));
  },

  /**
   * Make a request to the authorization service
   * @param {Object} credentions, set of credentials
   * @return $.Deferred
   */
  request: function(credentials) {
    return Ember.$.ajax({
      url: this.url,
      type: 'POST',
      dataType: 'json',
      data: credentials
    });
  }
});