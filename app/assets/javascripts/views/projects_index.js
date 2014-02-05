CrowddedApp.Views.ProjectsIndex = Backbone.View.extend({
  render: function() {
    var self = this;

    this.$el.html(JST['projects/index']());

    this.collection.each(function(project) {
      var projectView = new CrowddedApp.Views.ProjectView({ model: project });
      self.$('table').append(projectView.render().el);
    });
  }
});