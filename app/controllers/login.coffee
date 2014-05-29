LoginController = Ember.Controller.extend
  isError: false
  error: ''
  previousTransition: ''
  actions:
    login: ->
      Kinvey.User.login
        username: @username
        password: @password
      .then (user) =>
        previousTransition = @get("previousTransition")
        console.log 'Previous Transition: ', previousTransition
        if previousTransition
          @set "previousTransition", null
          previousTransition.retry()
        else
          @transitionToRoute "projects"
      , (err)=>
        @set 'isError', true
        @set 'error', err.description

`export default LoginController`