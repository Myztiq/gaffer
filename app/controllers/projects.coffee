ProjectsController = Ember.ArrayController.extend
  showAdd: false
  creating: false
  sortProperties: ['createdAt']
  sortAscending: false
  actions:
    sortByNewest: ->
      @set 'sortAscending', false

    sortByOldest: ->
      @set 'sortAscending', true

    toggleShowAdd: ->
      console.log @showAdd
      @set 'showAdd', !@showAdd

    add: ->
      colors = ['FF3300', 'CC3333', '993300', 'FF6633', 'FF9966', 'FF9900', 'CC9933', '996600', 'FFCC33', 'FFCC66', '003399', '333366', '003366', '3366CC', '6699CC', '009933', '339933', '006633', '33CC66', '66CC99']
      @set 'creating', true
      @store.createRecord 'project',
        name: @name
        description: @description
        url: @url
        color: colors[Math.floor(Math.random()*colors.length)]
      .save()
      .then (doc)=>
        @set 'name', ''
        @set 'description', ''
        @set 'url', ''
        @set 'showAdd', false
        @transitionTo 'project', doc.id
      , (err)->
        console.error err
        @set 'creating', false
        @set 'showAdd', false

    cancel: ->
      @set 'showAdd', false

`export default ProjectsController`