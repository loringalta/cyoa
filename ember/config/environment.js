/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'food-search',
    environment:  environment,
    baseURL:      '/',
    locationType: 'auto',
    EmberENV:     {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },
    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    }
  };


  ENV.coffeeOptions = {
    lint: true
  }

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    // ENV.APP.LOG_ACTIVE_GENERATION    = true;
    ENV.APP.LOG_TRANSITIONS          = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    ENV.APP.LOG_VIEW_LOOKUPS         = true;
  }

  if (environment === 'test') {
    ENV.baseURL = '/';
    ENV.locationType = 'none';
    ENV.APP.LOG_VIEW_LOOKUPS      = false;
    ENV.APP.rootElement = '#ember-testing';

  }

  if (environment === 'production') {

  }

  ENV['simple-auth'] = {
    authenticator: 'authenticator:custom',
    authorizer: 'simple-auth-authorizer:devise',
    session: 'session:custom',
    crossOriginWhitelist: ['localhost:3000']
  };

  ENV['simple-auth-devise'] = {
    serverTokenEndpoint: 'http://localhost:3000/users/sign_in',
    tokenAttributeName: 'token',
    identificationAttributeName: 'email'
  };

  ENV['contentSecurityPolicyHeader'] = 'Content-Security-Policy';

  ENV['contentSecurityPolicy'] = {
    'default-src': "'none'",
    'script-src': "'self'",
    'font-src': "'self' data: http://fonts.gstatic.com http://fonts.googleapis.com",
    'connect-src': "'self' http://localhost:3000",
    'img-src': "'self'",
    'style-src': "'self' 'unsafe-inline' http://fonts.googleapis.com",
    'media-src': "'self'",
    'report-uri': '/api/csp-report'
  };

  return ENV;
};