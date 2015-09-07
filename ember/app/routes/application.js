import Ember from 'ember';
import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin';

export default Ember.Route.extend(SimpleAuth.ApplicationRouteMixin, {
  beforeModel: function () {
    this._super.apply(this, arguments);
    return this.csrf.fetchToken();
  }
});
