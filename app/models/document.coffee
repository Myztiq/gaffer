document = Kinvey.Model.extend
  name: DS.attr('string')
  project: DS.belongsTo('project')
  schema: DS.belongsTo('schema')

`export default document`