export default DS.ActiveModelAdapter.extend({
  namespace: 'api',
  headers: function() {
    return {
      "X-XSRF-TOKEN": Ember.get(document.cookie.match(/XSRF\-TOKEN\=([^;]*)/), "1")
    }
  }.property().volatile()
});
