user = {
	firstName: undefined,
	lastName: undefined,
	password: undefined,
	email: undefined
};

route = Ember.Route.extend
  model: ->
    user

  setupController: (controller)->
    controller.set('model', 'sign-up')

`export default route`