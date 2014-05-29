NewAccountController = Ember.Controller.extend 
  isError: false
  error: ''
  actions:
    create: ->
      Kinvey.User.signup
        firstName: @firstName
        lastName: @lastName
        password: @password
        email: @email
        username: @email
      .then (user) =>
        @transitionToRoute "projects"
      , (err)=>
        @set 'isError', true
        @set 'error', JSON.parse(err.debug.responseText).description

`export default NewAccountController`