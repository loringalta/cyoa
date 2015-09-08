`import DS from 'ember-data'`

FoodItem = DS.Model.extend
  user: DS.belongsTo('User')
  name: DS.attr('string')
  group: DS.attr('string')
  foodid: DS.attr('number')
  nutrients: DS.hasMany('nutrients'),  async:true

`export default FoodItem`
