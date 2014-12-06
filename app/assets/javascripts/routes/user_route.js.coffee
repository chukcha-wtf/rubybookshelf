App.UserRoute = Ember.Route.extend({
  model: (params) ->
    @store.find('user', params.user_id)
  setupController: (controller, model) ->
    controller.set('user', model)
})