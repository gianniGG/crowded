CrowddedApp.Routers.Projects = Backbone.Router.extend({
  routes: {
    "": "index"
  },
  index: function() {
    var view = new CrowddedApp.Views.ProjectsIndex({ collection: CrowddedApp.projects });
    console.log(view.render())
    $('body').html(view.render().$el);
  }
});