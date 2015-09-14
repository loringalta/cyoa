`import DS from 'ember-data'`

User = DS.Model.extend
  email: DS.attr()
  username: DS.attr()
  food_item: DS.hasMany('food-items')

`export default User`
