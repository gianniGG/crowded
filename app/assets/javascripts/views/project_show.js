CrowddedApp.Views.ProjectShow = Backbone.View.extend({
  render: function() {
    this.$el.html(JST['projects/show']({ model: this.model }));
    return this;
  }
})