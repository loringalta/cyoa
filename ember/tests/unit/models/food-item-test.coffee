`import { moduleForModel, test } from 'ember-qunit'`
`import startApp from 'food-search/tests/helpers/start-app'`

application = null
store = null

moduleForModel 'foodItem', 'Food Item Model', {
  needs: [
    'model:nutrient'
    'model:user'
  ]
  setup: ->
    application = startApp()
    store = application.__container__.lookup('store:main')
    return
}

test 'Nutrient relationship', (assert) ->
  assert.expect(2)
  nutr = @store().modelFor('nutrient')
  relationship = Ember.get(nutr, 'relationshipsByName').get('food_item')
  assert.equal(relationship.key, 'food_item')
  assert.equal(relationship.kind, 'belongsTo')


test 'User relationship', (assert) ->
  assert.expect(2)
  user = @store().modelFor('user')
  relationship = Ember.get(user, 'relationshipsByName').get('food_item')
  assert.equal relationship.key, 'food_item'
  assert.equal relationship.kind, 'hasMany'
