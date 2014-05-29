project = Kinvey.Model.extend
  name: DS.attr('string')
  description: DS.attr('string')
  url: DS.attr('string')
  color: DS.attr('string')

  liStyle:(->
    """
      border-left: 5px solid ##{@get 'color'};
    """
  ).property 'color'

`export default project`