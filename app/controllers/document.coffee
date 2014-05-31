DocumentController = Ember.ObjectController.extend
  keys: (->
    @eachLocal (key)->
      console.log key

    return []

  ).property().volatile()

`export default DocumentController`