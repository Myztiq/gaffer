route = Ember.Route.extend
  model: ->
    error = ''
    new App.MyUser()
  setupController: (controller)->
    controller.set('model', 'login')

`export default route`