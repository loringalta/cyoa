`import DS from 'ember-data'`

Account = DS.Model.extend
  email: DS.attr()
  username: DS.attr()
  food_item: DS.hasMany('food-items')
  
`export default Account`