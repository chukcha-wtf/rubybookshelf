App.LoginRoute = Ember.Route.extend({
  setupController: (controller, model) ->
    controller.observeUser()
})