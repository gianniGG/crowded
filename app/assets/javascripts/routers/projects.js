CrowddedApp.Routers.Projects = Backbone.Router.extend({
  routes: {
    "":"index",
    "projects":"index"
  },

  index: function() {
    var view = new CrowddedApp.Views.ProjectsIndex({ collection: CrowddedApp.projects });
    $('body').html(view.render().$el);
  }
});