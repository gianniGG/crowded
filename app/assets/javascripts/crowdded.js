var CrowddedApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(data) {
    this.projects = new CrowddedApp.Collections.Projects(data.projects);
    new CrowddedApp.Routers.Tasks();
    Backbone.history.start();
  }
};
