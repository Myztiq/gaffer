route = Ember.Route.extend
  beforeModel: (transition) ->
    @transitionTo 'documents'

`export default route`