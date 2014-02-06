CrowddedApp.Collections.Projects = Backbone.Collection.extend({
  model: Project,
  rootUrl: '/projects/index',
  url: '/projects/index.json'
});

