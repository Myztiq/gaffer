NewAccountController = Ember.ObjectController.extend Ember.Validations.Mixin,

  init: ->
    @_super()
    @set 'errors', {}

  validations: 
    firstName:
      presence: true

  firstName: ''

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