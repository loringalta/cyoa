import Ember from 'ember';

export default Ember.Controller.extend({
  authenticator: 'simple-auth-authenticator:devise',

  actions: {
    authenticate: function() {
      var data = this.getProperties('identification', 'password');
      return this.get('session').authenticate('simple-auth-authenticator:devise', data);
    }
  }
});
