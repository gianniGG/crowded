CrowddedApp.Collections.Projects = Backbone.Collection.extend({
  model: Project,
  url: '/projects'
});

CrowddedApp.Collections.Project = Backbone.Collection.extend({
  model: Proj,
  url: '/projects/:id'
});
