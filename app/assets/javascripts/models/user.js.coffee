App.User = DS.Model.extend
  fullname: DS.attr 'string'
  bio: DS.attr 'string'
  email: DS.attr 'string'
  created_at: DS.attr 'date'