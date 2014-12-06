App.Book = DS.Model.extend
  title: DS.attr 'string'
  description: DS.attr 'string'
  user: DS.belongsTo 'user'
  # author: DS.belongsTo 'author'
