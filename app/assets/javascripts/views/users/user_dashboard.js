CrowddedApp.Views.UserDashboardView = Backbone.View.extend({
  render: function() {
    this.$el.html(JST['users/dashboard']({ model: this.model }));
    return this;
  }
});