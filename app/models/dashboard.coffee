route = Ember.Route.extend
  model: ->
  setupController: (controller)->
    controller.set('model', 'dashboard')

`export default route`