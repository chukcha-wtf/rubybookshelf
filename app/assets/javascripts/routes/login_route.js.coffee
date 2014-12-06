App.LoginRoute = Ember.Route.extend({
  setupController: (controller, model) ->
    @get('controller').clearData()
    controller.observeUser()
})