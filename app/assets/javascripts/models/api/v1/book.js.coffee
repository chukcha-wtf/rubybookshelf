# for more details see: http://emberjs.com/guides/models/defining-models/

Rubybookshelf.ApiV1Book = DS.Model.extend
  title: DS.attr 'string'
  description: DS.attr 'string'
  author: DS.belongsTo 'Rubybookshelf.Author'
  user: DS.belongsTo 'Rubybookshelf.User'
