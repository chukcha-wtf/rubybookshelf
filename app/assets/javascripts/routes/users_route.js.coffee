App.UsersRoute = Ember.Route.extend({
  setupController: (controller, model) ->
    @store.find('user').then (data)->
      controller.set('users', data)
    , (error) ->
      controller.showError(error)
})  