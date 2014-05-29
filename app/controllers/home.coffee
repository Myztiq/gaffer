HomeController = Ember.Controller.extend
  loggedIn: Kinvey.getActiveUser()
  actions:
    logOut: ->
      user = Kinvey.getActiveUser()
      if null isnt user
        user.logout().then (response) =>
          console.log 'logged out'
          @transitionToRoute "index"
        , (err)->
          console.log 'Could not log out', err

`export default HomeController`