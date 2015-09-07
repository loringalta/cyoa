import DS from 'ember-data';
import Ember from 'ember';

export default DS.ActiveModelAdapter.extend({
  namespace: 'api',
  headers:  Ember.computed(function() {
    return {
      "X-XSRF-TOKEN": Ember.get(document.cookie.match(/XSRF\-TOKEN\=([^;]*)/), "1")
    };
  }).property().volatile()
});
