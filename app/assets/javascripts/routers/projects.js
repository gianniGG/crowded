CrowddedApp.Routers.Projects = Backbone.Router.extend({
  routes: {
    "":"index",
    "projects":"index",
    "projects/:id":"show",
    "companies/:id/projects/:id":"show"
  },

  index: function() {
    var index = new CrowddedApp.Views.ProjectsIndex({
      collection: CrowddedApp.projects
    });
    $('body').html(index.render().$el);
  },

  show: function() {
    var show = new CrowddedApp.Views.ProjectShow({
      collection: CrowddedApp.Collections.Project
    });
    $('body').html(show.render().$el);
  }
});