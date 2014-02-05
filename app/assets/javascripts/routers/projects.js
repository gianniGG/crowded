CrowddedApp.Routers.Tasks = Backbone.Router.extend({
  routes: {
    "": "index"
  },
  index: function() {
    var view = new CrowddedApp.Views.ProjectsIndex({ collection: CrowddedApp.projects});
    $('body').html(view.render().$el);
  }
});