`import Ember from 'ember'`

MainSearchComponent = Ember.Component.extend
  tagName: 'input'
  classNames: ['form-control']
  classNameBindings: ['inputSize']
  inputSize: 'input-md'
  type: 'hidden'
  placeholder: null
  multiple: true

  didInsertElement: ->
    self = this
    options = {}
    options.multiple = self.get('multiple')
    options.placeholder = self.get('placeholder')
    options.tokenSeparators = [ ',' ]
    options.tags = ["red", "blue"]

    options.formatSelection = (item) ->
      self.formatItemForSelect2 item

    options.formatResult = (item) ->
      self.formatItemForSelect2 item

    options.createSearchChoice = (term) ->
      foundItem = null
      self.get('content').forEach (item) ->
        if item.get('name') == term
          foundItem = true
        return
      if !foundItem
        console.log term
        foundItem = Ember.Object.create(
          id: term
          name: term
          text: term
          'isNew': true)
      console.log foundItem
      return foundItem

    options.formatSelectionCssClass = (data) ->
      cssClass = 'select2-search-choice-old'
      if data != undefined and data.get != undefined and data.get('isNew')
        cssClass = 'select2-search-choice-new'
      cssClass

    options.query = (options) ->
      select2 = this
      filteredContent = self.get('content').reduce(((results, item) ->
        console.log "what", Ember.get(item, 'name')
        if select2.matcher(options.term, Ember.get(item, 'name'))
          results.push item
        results
      ), [])
      options.callback results: filteredContent
      return

    self._select = self.$().select2(options)
    self._select.on 'select2-selecting', (e) ->
      self.get('selected').pushObject e.choice
      food_item = self.get('selected').get('lastObject').get('name')
      self.searchForItem(food_item)
      return

    self._select.on 'select2-removed', (e) ->
      self.get('selected').removeObject e.choice
      return

  searchForItem: (item) ->
    if (!item)
      return
    console.log "item", item
    return @sendAction('action', item)

  formatItemForSelect2: (item) ->
    if (!item)
      return
    text = Ember.get(item, "name")
    return Ember.Handlebars.Utils.escapeExpression(text)
  #
  # selectedObserver: ->
  #   self = this
  #   Ember.run.later (->
  #       self._select.select2('data', self.get('selected'))
  #     ).observes('selected.length')

`export default MainSearchComponent`
