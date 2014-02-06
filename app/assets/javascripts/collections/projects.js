CrowddedApp.Collections.Projects = Backbone.Collection.extend({
  model: Project,
  rootUrl: '/projects'
});

CrowddedApp.Collections.TrendingProjects = Backbone.Collection.extend({
  model: Project,
  rootUrl: '/projects'
});
