`import Ember from 'ember'`

FoodCardComponent = Ember.Component.extend
  actions:
    deleteWidget: ->
      self = this
      $(".card .delete-widget").on 'click', (e) ->
        $(this).closest('.card').remove()
        parent = $(this).parent('.card')
        text = parent.find('h1').text()
        content = self.get('content')
        self.removeFromContent text, content
        e.preventDefault()
        return
      return
  removeFromContent: (text, content) ->
    self = this
    for item in content
      do (item) ->
        console.log "before", content
        if item.get('name') == text
          content.removeObject(item)
          console.log "after", content
          return
      return
    return content


`export default FoodCardComponent`
