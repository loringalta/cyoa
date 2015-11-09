`import Ember from 'ember'`

FoodCardComponent = Ember.Component.extend
  actions:
    favorite: (food_name) ->
      this.sendAction('favorite', food_name)
      return food_name
    deleteWidget: (food_name)->
      $(".card .delete-widget").on 'click', (e) ->
        $(this).closest('.card').remove()
        e.preventDefault()
        return
      this.sendAction('delete', food_name)
      return
    removeFromContent: (text) ->
      self = this




`export default FoodCardComponent`
