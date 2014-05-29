route =  Ember.Route.extend
  serialize: (model)->
    project_id: model.get('project').get 'id'
    document_id: model.get 'id'

`export default route`