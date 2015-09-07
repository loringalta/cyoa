`import DS from 'ember-data'`

Nutrient = DS.Model.extend
  nutrient_name: DS.attr('string'), async: true
  unit: DS.attr('string'), async: true
  value: DS.attr('number'), async: true
  nutrient_title: DS.attr('string'), async: true

`export default Nutrient`
