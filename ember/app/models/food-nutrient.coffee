`import DS from 'ember-data'`

FoodNutrient = DS.Model.extend {
  nutrient_name: DS.attr('string')
  unit: DS.attr('string')
  value: DS.attr('number')
}

`export default FoodNutrient`
