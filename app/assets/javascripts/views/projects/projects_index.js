CrowddedApp.Views.ProjectsIndex = Backbone.View.extend({
  className: 'project-index',

  initialize: function() {
    this.collection.on('add', this.addOne, this)
    // this.collection.on('reset', this.addAll, this)
  },

  addOne: function(project) {
    var projectView = new CrowddedApp.Views.ProjectView({model: project, id: project.id});
    this.$('.project-items').append(projectView.render().el);
  },

  addAll: function() {
    // this.$('.project-items').html('');
    // this.collection.forEach(this.addOne, this)
  },

  render: function() {
    this.$el.html(JST['projects/index']());
    this.collection.fetch();
    return this;
  }

});
