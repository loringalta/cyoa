`import DS from 'ember-data'`

FoodItem = DS.Model.extend {
  name: DS.attr('string')
  group: DS.attr('string')
  foodid: DS.attr('number')
  nutrients: DS.hasMany('nutrients')
}

`export default FoodItem`
