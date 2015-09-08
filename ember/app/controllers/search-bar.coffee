`import Ember from 'ember'`

SearchBarController = Ember.Controller.extend
  queryParams: ['numberOfResults', 'searchQuery']
  numberOfResults: null
  searchQuery: null
  actions:
    add: ->
      add_query = @get('addQuery')
      numberOfResults = @get('numberOfResults')
      $.ajax(
        type: 'GET'
        datatype: 'json'
        url: "/api/food_items?numberOfResults=#{numberOfResults}&searchQuery=#{add_query}").success((data) ->
          id = 0
          console.log data
          for item in data.food_items
            do (item) ->
              id++
              table = "<table class = 'pure-table'><thead><tr><th>#{item.name}</th><th>in 100 grams</th></tr></thead>"
              for nutrient in item.nutrient_ids
                do (nutrient) ->
                  for n in data.nutrients
                    do (n) ->
                      if n.id == nutrient
                        table += "<tr><td>#{n.nutrient_title}</td><td>#{n.value} #{n.unit}</td></tr>"
              table += "<tr><td>Group</td><td>#{item.group}</td></tr>"
              table += "</tbody></table"
              brick = "<div class='brick large-#{id}'><a class = 'delete-widget'>x</a>#{table}</div>"
              $('.gridly').append(brick)
        )
    deleteWidget: -> 
      $(".gridly .delete-widget").on 'click', ->
        $(this).closest('.brick').remove()
    search: ->
      searchQuery = @get('searchQuery')
      numberOfResults = @get('numberOfResults')
      @set 'numberOfResults', numberOfResults
      @set 'searchQuery', searchQuery
      $('.gridly').gridly(
        base: 280
        gutter: 10
        'responsive': true
      )

`export default SearchBarController`
