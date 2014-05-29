# Replace `App Key` and `App Secret` with your application credentials.
kinveyOptions =
  appKey: "kid_PVzaqUQcx9"
  appSecret: "457d92449b2641e2b3145e6ac4a597a3"
  debug: true # Enable debug mode (development only).
  userType: 'user'

# Add the Kinvey initializer.
KinveyInitializer =
  name: "kinvey"
  initialize: (container, application) ->
    # `Kinvey.init` returns a boolean indicating whether there is an
    # active user. If so, reload the user to fetch all its attributes
    # (username, e-mail, etc.).
    isLoggedIn = Kinvey.init(container, application, kinveyOptions)
    Kinvey.getActiveUser().reload() if isLoggedIn

`export default KinveyInitializer`