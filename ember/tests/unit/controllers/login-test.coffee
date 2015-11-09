`import Ember from 'ember'`
`import { moduleFor, test } from 'ember-qunit'`
`import startApp from 'food-search/tests/helpers/start-app'`

moduleFor 'controller:login', {
  beforeEach: ->
    application = startApp()
    return
}
