document = Kinvey.Model.extend
  project: DS.belongsTo('project')
  schema: DS.belongsTo('schema')
  configuration: DS.attr 'raw'
`export default document`