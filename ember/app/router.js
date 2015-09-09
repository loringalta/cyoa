import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});


Router.map(function() {
  this.resource('session', function() {

  });
  this.resource('users', function() {
    this.route('signup');
    this.route('user', {
      path: '/user/:user_id'
    });
  });

  this.route('login');
  this.resource('search-bar', function(){
    this.route('food-item');
  });
  this.resource('food-item', { path: '/food-item/:searchQuery' });

});


export default Router;
