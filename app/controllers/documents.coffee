ProjectsController = Ember.ArrayController.extend
  isCreatingDocument: false
  sortProperties: ['createdAt']
  sortAscending: false
  actions:
    newDocument: ->
      @set 'isCreatingDocument', true
      @store.createRecord 'document',
        configuration:
          name: 'New Document'
      .set('project', @get('project'))
        .save()
        .then (doc)=>
            @set 'isCreatingDocument', false
            @transitionTo 'document', doc

`export default ProjectsController`