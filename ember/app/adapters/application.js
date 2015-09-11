import DS from 'ember-data';
import Ember from 'ember';
import OAuth2 from 'simple-auth-oauth2/authenticators/oauth2';

export default DS.RESTAdapter.extend({
  namespace: 'api',
  pathForType: function(modelName) {
    modelName = 'food-item'
    var underscore = Ember.String.underscore(modelName)
    return Ember.String.pluralize(underscore);
  },
  headers: function() {
    return {
      "access_token": Ember.get(document.cookie.match(/XSRF\-TOKEN\=([^;]*)/), "1")
    };
  }.property().volatile()
});
