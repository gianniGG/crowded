CrowddedApp.Routers.Projects = Backbone.Router.extend({
  routes: {
    "projects":"index",
    "projects/:id":"show"
  },

  index: function() {
    var view = new CrowddedApp.Views.ProjectsIndex({ collection: CrowddedApp.projects });
    $('body').html(view.render().$el);
  },

  show: function() {
    var view = new CrowddedApp.Views.ProjectShow({ collection: CrowddedApp.projects });
    $('body').html(view.render().$el);
  }
});