import testHelper from '../helpers/test-helper';

export function initialize(/* container, application */) {
  Ember.Handlebars.registerHelper('test-helper', testHelper);
};

export default {
  name: 'test-helper',
  initialize: initialize
};
