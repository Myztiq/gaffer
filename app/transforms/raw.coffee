transform = DS.Transform.extend
  deserialize: (serialized)-> serialized
  serialize: (deserialized)-> deserialized

`export default transform`