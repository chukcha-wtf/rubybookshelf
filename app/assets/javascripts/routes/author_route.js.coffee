App.AuthorRoute = Ember.Route.extend({
  model: (params) ->
    @store.find('author', params.author_id)
  setupController: (controller, model) ->
    controller.set('author', model)
})