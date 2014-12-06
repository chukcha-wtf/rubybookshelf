App.ApplicationRoute = Ember.Route.extend({
  beforeModel: ->
    @controllerFor('header').checkUser()
})

