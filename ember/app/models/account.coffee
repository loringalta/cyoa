`import DS from 'ember-data'`

Account = DS.Model.extend
  login: DS.attr()
  name: DS.attr()
  food_item: DS.hasMany('food-items')
  
`export default Account`