import Ember from 'ember';


export default Ember.Controller.extend({
  actions: {
    search: function() {
      var data = this.getProperties('numberOfResults', 'searchQuery');
    }
  }
});
