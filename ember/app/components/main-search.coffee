`import Ember from 'ember'`

MainSearchComponent = Ember.Component.extend
  tagName: 'input'
  classNames: ['form-control']
  classNameBindings: ['inputSize']
  inputSize: 'input-md'
  placeholder: null
  multiple: true

  didInsertElement: ->
    self = this
    options = {}
    options.multiple = self.get('multiple')
    options.placeholder = self.get('placeholder')
    options.tokenSeparators = [ ',' ]

    options.formatSelection = (item) ->
      self.formatItemForSelect2 item

    options.formatResult = (item) ->
      self.formatItemForSelect2 item

    options.createSearchChoice = (term) ->
      foundItem = null
      self.get('content').forEach (item) ->
        if item.get('id') == term
          foundItem = true
        return
      if !foundItem
        foundItem = Ember.Object.create(
          id: term
          'isNew': true)
      return foundItem

    options.formatSelectionCssClass = (data) ->
      console.log "main-search", data
      cssClass = 'select2-search-choice-old'
      if data != undefined and data.get != undefined and data.get('isNew')
        cssClass = 'select2-search-choice-new'
      cssClass

    options.query = (query) ->
      select2 = this
      filteredContent = self.get('content').reduce(((results, item) ->
        if select2.matcher(query.term, Ember.get(item, 'id'))
          results.push item
        results
      ), [])
      query.callback results: filteredContent
      return

    self._select = self.$().select2(options)
    self._select.on 'select2-selecting', (e) ->
      self.get('selected').pushObject e.choice
      food_item = self.get('selected').get('lastObject').id
      self.searchForItem(food_item)
      return

    self._select.on 'select2-removed', (e) ->
      self.get('selected').removeObject e.choice
      return

  searchForItem: (item) ->
    if (!item)
      return
    return @sendAction('action', item)

  formatItemForSelect2: (item) ->
    if (!item)
      return
    text = Ember.get(item, "id")
    return Ember.Handlebars.Utils.escapeExpression(text)
  #
  # selectedObserver: ->
  #   self = this
  #   Ember.run.later (->
  #       self._select.select2('data', self.get('selected'))
  #     ).observes('selected.length')

`export default MainSearchComponent`
