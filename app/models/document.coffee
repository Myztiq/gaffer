document = Kinvey.Model.extend
  name: DS.attr('string')
  project: DS.belongsTo('project')

`export default document`