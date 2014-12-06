App.User = DS.Model.extend
  fullname: DS.attr 'string'
  bio: DS.attr 'string'
  email: DS.attr 'string'
  created_at: DS.attr 'date'
  role: DS.attr 'string'
  books: DS.hasMany 'book', { async: true } 
  books: DS.hasMany 'author', { async: true } 
