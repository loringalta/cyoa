`import { moduleForModel, test } from 'ember-qunit'`

moduleForModel 'food-item', 'Unit | Model | food item', {
  # Specify the other units that are required for this test.
  needs: []
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model
