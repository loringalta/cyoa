/* global require, module */
var EmberApp = require('ember-cli/lib/broccoli/ember-app');

module.exports = function(defaults) {
  var app = new EmberApp({
    emberCliFontAwesome: {
      useScss: true
    }
  });
  app.import('bower_components/gridly/javascripts/jquery.gridly.js');
  app.import('bower_components/gridly/stylesheets/jquery.gridly.css');
  
  return app.toTree();
};
