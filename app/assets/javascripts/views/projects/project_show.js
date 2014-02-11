CrowddedApp.Views.ProjectShow = Backbone.View.extend({
  initialize: function() {
  },

  render: function() {
    console.log(this.collection)
    this.$el.html(JST['projects/show']({ model: this.model }));
    return this;
  }
});