prettyColor = Ember.Component.extend
  classNames: ['pretty-color']
  attributeBindings: ['style']
  style: ( ->
    return 'color: ' + this.get('name') + ';'
  ).property('name')

`export default  prettyColor`