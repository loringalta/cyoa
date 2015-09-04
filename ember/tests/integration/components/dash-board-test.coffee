`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'dash-board', 'Integration | Component | dash board', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{dash-board}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#dash-board}}
      template block text
    {{/dash-board}}
  """

  assert.equal @$().text().trim(), 'template block text'
