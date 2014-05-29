route =  Ember.Route.extend
  setupController: (controller)->
    controller.set('model', 'application')

`export default route`