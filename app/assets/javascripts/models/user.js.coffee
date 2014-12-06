App.User = DS.Model.extend
  fullname: DS.attr 'string'
  bio: DS.attr 'string'
  email: DS.attr 'string'
  created_at: DS.attr 'date'
  books: DS.hasMany 'book', { async: true } 

# App.UserSerializer = DS.RESTSerializer.extend({
#   extractSingle: (store, type, payload, id, requestType) ->

#     @._super(store, type, transaction_payload, id, requestType);

#   extractArray: (store, type, payload, id, requestType) ->

#     @._super(store, type, transaction_payload, id, requestType);

# });