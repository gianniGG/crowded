CrowddedApp.Routers.Users = Backbone.Router.extend({
  routes: {
    "users/:id/dashboard":"show"
  },

  show: function() {
    var view = new CrowddedApp.Views.UserDashboardView({ collection: CrowddedApp.users });
    $('body').html(view.render().$el);
  }
});