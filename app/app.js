import Resolver from 'ember/resolver';
import KinveyInitializer from 'gaffer/initializers/kinvey';
import ActiveUserInitializer from 'gaffer/initializers/kinvey-active-user';
//import loadInitializers from 'ember/load-initializers';

Ember.MODEL_FACTORY_INJECTIONS = true;

Ember.Application.initializer(KinveyInitializer);
Ember.Application.initializer(ActiveUserInitializer);

var App = Ember.Application.extend({
  modulePrefix: 'gaffer', // TODO: loaded via config
  Resolver: Resolver
});
App.Store = DS.Store.extend();

//loadInitializers(App, 'gaffer');


export default App;