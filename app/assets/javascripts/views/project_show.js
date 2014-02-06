CrowddedApp.Views.ProjectShow = Backbone.View.extend({
  render: function() {
    this.$el.html(JST['projects/show']({ model: this.collection.first() }));
    return this;
  }
});