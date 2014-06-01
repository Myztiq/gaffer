DocumentController = Ember.ObjectController.extend

  init: ->
    @_super()
    schemaList = @store.find('schema')
    @set 'schemaList',schemaList
    schemaList.then =>
      @set 'selectedSchema', @get 'schema.id'

  keys: {
    "name": "string"
  }

  schemaList: []

  schemaSelect: (->
    rtn = [
      {
        label: '---'
        value: '---'
      }
    ]
    @get('schemaList').forEach (schema)->
      rtn.push
        label: schema.get 'name'
        value: schema.get 'id'

    rtn.push
      label: 'New Schema'
      value: 'new'

    rtn
  ).property 'schemaList.@each.id', 'schemaList.@each.name'

  selectedSchema: '---'
  isNewSchema: Ember.computed.equal 'selectedSchema', 'new'

  schemaWatcher: (->
    if !@get('isNewSchema') and @get('selectedSchema') != '---' and @get('selectedSchema')?
      @store.find('schema', @get('selectedSchema')).then (schema)=>
        @set 'schema', schema
  ).observes 'selectedSchema'

  saving: false
  flashSaved: false
  flasher: (->
    if @get 'flashSaved'
      Ember.run.later @, ->
        @set 'flashSaved', false
      , 2000
  ).observes 'flashSaved'

  actions:
    addField: ->
      @get('schema.fields').addObject {
        key: null
        type: 'string'
      }

    save: ->
      @set 'saving', true

      @get('content').save().then =>
        @get('schema').save().then =>
          @set 'saving', false
          @set 'flashSaved', true

    saveNewSchema: ->
      name = @get 'newSchemaName'
      @store.createRecord 'schema'
      .set 'name', name
      .set('project', @get('project'))
      .set 'fields', [{key: 'name', type: 'string'}]
      .save()
      .then (doc)=>
        @get('schemaList').addObject doc
        @set 'selectedSchema', doc.get('id')

`export default DocumentController`