import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});


Router.map(function() {
  this.resource('users', function() {
    this.route('signup');
    this.route('user', {
      path: '/user/:user_id'
    });
  });
  this.route('login');
  this.route('search-bar');
  this.route('food-item');
});

export default Router;
