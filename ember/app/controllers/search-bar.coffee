`import Ember from 'ember'`

SearchBarController = Ember.Controller.extend
  queryParams: ['numberOfResults', 'searchQuery']
  numberOfResults: null
  searchQuery: null
  actions:
    favorite: ->
      # $(".gridly .fav").addEventListener 'click', (e) ->
      parent = $(this).parent('.brick')
      console.log model
      text = parent.find('h1').text()
      
      this.get('store').find(text).then ((answer) -> 
          console.log answer
          return
          ), (error) ->
          return
    add: ->
      add_query = @get('addQuery')
      numberOfResults = @get('numberOfResults')
      $.ajax(
        type: 'GET'
        datatype: 'json'
        url: "/api/food_items?numberOfResults=#{numberOfResults}&searchQuery=#{add_query}").success((data) ->
          id = 0
          for item in data.food_items
            do (item) ->
              id++
              table = "<table class = 'pure-table'><thead><th>in 100 grams</th></tr></thead>"
              for nutrient in item.nutrient_ids
                do (nutrient) ->
                  for n in data.nutrients
                    do (n) ->
                      if n.id == nutrient
                        table += "<tr><td>#{n.nutrient_title}</td><td>#{n.value} #{n.unit}</td></tr>"
              table += "<tr><td>Group</td><td>#{item.group}</td></tr>"
              table += "</tbody></table"
              brick = "<div class='brick large-#{id}'><h1 id = 'food_name'>#{item.name}</h1><a class = 'delete-widget'>x</a>#{table}</div>"
              $('.gridly').append(brick)
        )
    deleteWidget: -> 
      $(".gridly .delete-widget").on 'click', (e) ->
        $(this).closest('.brick').remove()
        e.preventDefault()
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
