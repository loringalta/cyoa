`import Ember from 'ember'`

SearchBarController = Ember.Controller.extend
  queryParams: ['numberOfResults', 'searchQuery']
  numberOfResults: null
  searchQuery: null
  actions:
    search: ->
      searchQuery = @get('searchQuery')
      numberOfResults = @get('numberOfResults')
      @set 'numberOfResults', numberOfResults
      @set 'searchQuery', searchQuery
      $('.gridly').gridly(
        base: 60
        gutter: 20
        columns: 12
        'responsive': true
      )

`export default SearchBarController`
