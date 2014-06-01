`import StringView from 'gaffer/views/input-views/string'`

typeMapping =
  string: StringView

InputSelector = Ember.ContainerView.extend
  init: ->
    @_super()
    @typeChanger()

  childViews: []

  typeChanger: (->
    type = @get 'type'
    view = typeMapping['string']
    view = typeMapping[type]

    myView = view.create()
    if @get('childViews.length') is 0
      @pushObject(myView)
    else
      @replace(0, 1, [myView])

  ).observes 'type'

  value: ((key, value)->
    key = @get 'key'
    path = "controller.configuration.#{key}"
    if value?
      @set path, value

    @get path
  ).property 'key'



`export default InputSelector`