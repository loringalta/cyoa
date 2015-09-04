`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'jquer1-test', 'Integration | Component | jquer1 test', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{jquer1-test}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#jquer1-test}}
      template block text
    {{/jquer1-test}}
  """

  assert.equal @$().text().trim(), 'template block text'
