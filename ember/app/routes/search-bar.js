import Ember from 'ember';
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin);

// // App.UsersRoute = Ember.Route.extend
//   model: ->
//     # Step 1: Query database for all users
//     @store.find('user')
//
//     # Step 2: Filter results (keep male users named "Steve")
//     @store.filter 'user', (user)->
//       user.get('name') == "Steve" && user.get('gender') == "Male"
