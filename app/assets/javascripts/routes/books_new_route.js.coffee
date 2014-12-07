App.BooksNewRoute = Ember.Route.extend({
  setupController: (controller, model) ->
    controller.prepareBook()
})  