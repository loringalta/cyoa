/* global require, module */
var EmberApp = require('ember-cli/lib/broccoli/ember-app');

module.exports = function(defaults) {
  var app = new EmberApp({
    emberCliFontAwesome: {
      useScss: true
    }
  });

  return app.toTree();
};
