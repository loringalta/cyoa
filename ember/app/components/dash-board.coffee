`import Ember from 'ember'`

DashBoard = Ember.Component.extend(
  age: 30,
  actions:
    pressed: ->
      $('.gridly').gridly(
        base: 60
        gutter: 20
        columns: 12
      )
)

`export default DashBoard`
