`import { moduleForModel, test } from 'ember-qunit'`
`import startApp from 'food-search/tests/helpers/start-app'`

moduleForModel 'nutrient', 'Unit | Model | nutrient', {
  needs: [
    'model:foodItem'
    'model:nutrient'
    'model:user'
  ]
  setup: ->
    application = startApp()
    store = application.__container__.lookup('store:main')
    return
}

test 'nutrient id', (assert) ->
  assert.expect(2)
  food_item = @store().modelFor('foodItem')
  relationship = Ember.get(food_item, 'relationshipsByName').get('nutrients')
  assert.equal(relationship.key, 'nutrients')
  assert.equal(relationship.kind, 'hasMany')
