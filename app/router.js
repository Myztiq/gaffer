var Router = Ember.Router.extend({
  location: ENV.locationType
});

Router.map(function() {
  this.resource("login");
  this.resource("sign-up");
  this.resource("home", function(){
    this.resource("projects");
    this.resource('project', { path: '/projects/:project_id' }, function(){
      this.resource('documents');
    });
    this.resource('document', {path: '/projects/:project_id/documents/:document_id'});
    this.resource("dashboard");
  });
});

Router.reopen({
  location: 'history'
});

export default Router;
