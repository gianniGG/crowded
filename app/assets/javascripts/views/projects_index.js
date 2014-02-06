CrowddedApp.Views.ProjectsIndex = Backbone.View.extend({
  className: 'project-index',

  render: function() {
    var self = this;

    this.$el.html(JST['projects/index']());

    this.collection.on('sync', function(){
      self.$('.project-items').html('');
      self.collection.each(function(project){
        var projectView = new CrowddedApp.Views.ProjectView({model:project});
        self.$('.project-items').append(projectView.render().el);
      });
    });

    this.collection.fetch({data: $.param({id: '17'})});

    return this;
  }
});
