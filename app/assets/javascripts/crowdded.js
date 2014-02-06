var CrowddedApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(data) {
    this.projects = new CrowddedApp.Collections.Projects(data.projects);
    new CrowddedApp.Routers.Projects();
    Backbone.history.start({pushState: true});
  }
};
