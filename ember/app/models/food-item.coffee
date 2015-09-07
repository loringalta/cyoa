`import DS from 'ember-data'`

FoodItem = DS.Model.extend
  name: DS.attr('string'), async:true
  group: DS.attr('string'),  async:true
  foodid: DS.attr('number'),  async:true
  nutrients: DS.hasMany('nutrients'),  async:true

`export default FoodItem`
