import DS from 'ember-data';

export default DS.ActiveModelAdapter.extend({
  namespace: 'api',
  headers: function() {
    return {
  "X-XSRF-TOKEN": decodeURIComponent(Ember.get(document.cookie.match(/XSRF\-TOKEN\=([^;]*)/), "1"))
}
  }.property().volatile()
});
