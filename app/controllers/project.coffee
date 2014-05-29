ProjectController = Ember.ObjectController.extend
  isEditing: false
  isSaving: false
  pickColors: false
  colors: ['FF3300', 'CC3333', '993300', 'FF6633', 'FF9966', 'FF9900', 'CC9933', '996600', 'FFCC33', 'FFCC66', '003399', '333366', '003366', '3366CC', '6699CC', '009933', '339933', '006633', '33CC66', '66CC99']
  backgroundStyle:(->
    "background-color: ##{@get 'color'}"
  ).property 'color'

  actions:
    edit: ->
      @set 'isEditing', true

    doneEdit: ->
      @set 'isSaving', true
      @get('model').save().then =>
        console.log 'Save Success'
      , (err)=>
        console.error err
      .then =>
        @set 'isSaving', false
        @set 'isEditing', false

    delete: ->
      @get('model').destroyRecord().then =>
        @transitionToRoute "projects"

    changeColor: (color)->
      @set 'color', color

    abort: ->
      @set 'isEditing', false
      @get('model').rollback()
      console.log 'abort'
      @transitionToRoute "projects"



`export default ProjectController`