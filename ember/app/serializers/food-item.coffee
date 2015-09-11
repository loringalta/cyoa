`import DS from 'ember-data'`

FoodItemSerializer = DS.RESTSerializer.extend
  isNewSerializerAPI: true
  attrs:
    nutrients: "nutrient_ids"

`export default FoodItemSerializer`
