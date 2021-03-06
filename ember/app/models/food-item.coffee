`import DS from 'ember-data'`

FoodItem = DS.Model.extend
  account: DS.belongsTo('user')
  name: DS.attr('string')
  group: DS.attr('string')
  foodid: DS.attr('number')
  nutrients: DS.hasMany('nutrient')

`export default FoodItem`
