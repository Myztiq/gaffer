stringView = Ember.View.extend
  templateName: 'input-views/string'

  value: Ember.computed.alias('parentView.value')

`export default stringView`