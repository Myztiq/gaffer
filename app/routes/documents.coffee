route =  Ember.Route.extend
  setupController: (controller, model)->
    controller.set 'model', model
    controller.set 'project',@modelFor 'project'
  model: ->
    @store.find('document')

`export default route`