App.AuthorsRoute = Ember.Route.extend({
  model: (params) ->
  setupController: (controller, model) ->
    @store.find('author').then (data)->
      controller.set('authors', data)
    , (error) ->
      controller.showError(error)
})  