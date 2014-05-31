NewAccountController = Ember.Controller.extend Ember.Validations.Mixin,
  validations: 
    firstName:
      presence: true
  errors: {}

  firstName: ''

  errorUpdater: (->
    error = @get('errors')
    console.log 'Error Updator'
    for key, val of error
      console.log val
      @notifyPropertyChange 'errors.'+key
  ).observes 'errors'

  noError: Ember.computed.empty('errors')
  isError: Ember.computed.not('noError')

  showErrors: false

  actions:
    create: ->
      if @get('noError')
        Kinvey.User.signup
          firstName: @firstName
          lastName: @lastName
          password: @password
          email: @email
          username: @email
        .then (user) =>
          @transitionToRoute "projects"
        , (err)=>
          @set 'errors', [err.description]
      else
        @notifyPropertyChange 'errors'
        @set 'showErrors', true

`export default NewAccountController`