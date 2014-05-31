DocumentController = Ember.ObjectController.extend

  init: ->
    @_super()
    schemaList = @store.find('schema')
    @set 'schemaList',schemaList
    schemaList.then =>
      @schemaWatcher()


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
      console.log 'Recalculating schema array', schema.get('id')
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
      console.log 'Schema that exists!', @get 'selectedSchema'
      @store.find('schema', @get('selectedSchema')).then (schema)=>
        @set 'schema', schema
    else
      console.log 'Schema that does not exist!', @get('selectedSchema')
  ).observes 'selectedSchema'

  actions:
    saveNewSchema: ->
      name = @get 'newSchemaName'
      @store.createRecord 'schema'
      .set 'name', name
      .set('project', @get('project'))
      .save()
      .then (doc)=>
        console.log 'Its been saved', doc.get('id')
        @get('schemaList').addObject doc
        @set 'selectedSchema', doc.get('id')

`export default DocumentController`