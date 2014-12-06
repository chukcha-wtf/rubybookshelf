App.Author = DS.Model.extend
  fullname: DS.attr 'string'
  bio: DS.attr 'string'
  books: DS.hasMany 'book', { async: true }
  user: DS.belongsTo 'user', { async: true }
