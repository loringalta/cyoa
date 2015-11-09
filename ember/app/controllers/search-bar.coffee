`import Ember from 'ember'`

SearchBarController = Ember.Controller.extend
  selected: []
  actions:
    delete: (food_item) ->
      self = this
      food = self.store.filter 'foodItem', (item) ->
        if item.get('name') == food_item
          item.unloadRecord()
          return
          return
    favorite: (food_item) ->
      self = this
      food = self.store.filter 'foodItem', (item) ->
        if item.get('name') == food_item
          user = self.get('session').get('user')
          user.get('food_item').pushObject(item)
          return user
          return
    search: (food_item_name) ->
      $('.gridly').gridly
        base: 60
        gutter: 20
        'responsive': true
      self = this
      self.store.find('foodItem', {'searchQuery' : food_item_name}).then ((data) ->
        return data
        )
      return
`export default SearchBarController`
