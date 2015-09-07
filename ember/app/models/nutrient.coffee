`import DS from 'ember-data'`

Nutrient = DS.Model.extend
  nutrient_name: DS.attr('string')
  unit: DS.attr('string')
  value: DS.attr('number')
  nutrient_title: DS.attr('string')

`export default Nutrient`
