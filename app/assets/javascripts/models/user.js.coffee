App.User = DS.Model.extend
  fullname: DS.attr 'string'
  bio: DS.attr 'string'
  email: DS.attr 'string'
  created_at: DS.attr 'date'
  role: DS.attr 'string'
  isGuest: (->
    @get('role') == 'guest'
  ).property('role')
  isUser: (->
    @get('role') == 'user'
  ).property('role')
  isAdmin: (->
    @get('role') == 'admin'
  ).property('role')
  exist: (->
    @get('id') != 'current'
  ).property('id')
  books: DS.hasMany 'book', { async: true } 
  authors: DS.hasMany 'author', { async: true } 
