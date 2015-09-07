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
    contentSecurityPolicy: {
      'default-src': "'none'",
      'script-src':  "'self' 'unsafe-inline' 'unsafe-eval' use.typekit.net connect.facebook.net maps.googleapis.com maps.gstatic.com",
      'font-src':    "'self' data: use.typekit.net",
      'connect-src': "'self'",
      'img-src':     "'self' www.facebook.com p.typekit.net",
      'style-src':   "'self' 'unsafe-inline' use.typekit.net",
      'frame-src':   "s-static.ak.facebook.com static.ak.facebook.com www.facebook.com"
    },
    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    },
    "simple-auth": {
      authorizer: 'simple-auth-authenticator:devise'
    },
    "simple-auth-devise": {
      resourceName: 'account'
    },
    railsCsrf: {
      csrfURL: 'api/csrf'
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
    ENV['simple-auth'].store = 'simple-auth-session-store:ephemeral';

  }

  if (environment === 'production') {

  }

  ENV['simple-auth'] = {
    crossOriginWhitelist: ['http://localhost:3000'],
    authorizer: 'simple-auth-authorizer:devise',
    store: 'simple-auth-session-store:local-storage',
    routeAfterAuthentication: '/search-bar'
  };
  ENV['simple-auth-devise'] = {
    tokenAttributeName: 'token',
    identificationAttributeName: 'email'
  };

  return ENV;
};
