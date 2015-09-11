`import { moduleForModel, test } from 'ember-qunit'`

moduleForModel 'food-item', 'Unit | Serializer | food item',
  # Specify the other units that are required for this test.
  needs: ['serializer:food-item']

# Replace this with your real tests.
test 'it serializes records', (assert) ->
  record = @subject()

  serializedRecord = record.serialize()

  assert.ok serializedRecord
