App.Book = DS.Model.extend
  title: DS.attr 'string'
  description: DS.attr 'string'
  user: DS.belongsTo 'user', { async: true }
  author: DS.belongsTo 'author', { async: true }
