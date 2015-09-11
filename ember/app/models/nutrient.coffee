`import DS from 'ember-data'`

Nutrient = DS.Model.extend
  food_item: DS.belongsTo('food-item')
  nutrient_name: DS.attr('string')
  unit: DS.attr('string')
  value: DS.attr('number')
  nutrient_title: DS.attr('string')

`export default Nutrient`
