route =  Ember.Route.extend
  model: ->
    @store.find('project')

  beforeModel: (transition) ->
    if not Kinvey.getActiveUser()
      loginController = @controllerFor("login")
      loginController.set "previousTransition", transition
      @transitionTo "login"
    return

`export default route`