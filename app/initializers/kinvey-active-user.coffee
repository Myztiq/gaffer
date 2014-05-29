# Add an additional initializer which injects the active user into your
# controllers and routers. This is optional.
ActiveUserInitializer =
  name: "activeUser"
  after: "kinvey"
  initialize: (container, application) ->
    application.inject "controller", "activeUser", "user:active"
    application.inject "router", "activeUser", "user:active"

`export default ActiveUserInitializer`