route = Ember.Route.extend
  beforeModel: (transition) ->
    if not Kinvey.getActiveUser()
      loginController = @controllerFor("login")
      loginController.set "previousTransition", transition
      @transitionTo "login"
    return

`export default route`