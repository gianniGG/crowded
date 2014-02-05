CrowddedApp.Views.ProjectView = Backbone.View.extend({
  render: function() {
    this.$el.html(JST['projects/project']({ model: this.model }));
    return this;
  }
});