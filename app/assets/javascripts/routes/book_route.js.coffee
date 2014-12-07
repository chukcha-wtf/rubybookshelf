App.BookRoute = Ember.Route.extend({
  model: (params) ->
    @store.find('book', params.book_id)
  setupController: (controller, model) ->
    controller.set('book', model)
    controller.set('authors', controller.store.find('author'))    
})