CrowddedApp.Views.ProjectsIndex = Backbone.View.extend({
  render: function() {
    this.$el.html(JST['projects/index']({projects: this.collection}));
    return this;
  }
})