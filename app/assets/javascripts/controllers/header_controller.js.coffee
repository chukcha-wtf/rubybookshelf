App.HeaderController = Ember.ArrayController.extend({
  user: null,
  loggedIn: null,
  errorMessage: null,

  actions: 
    logout: ->
      controller = @
      Em.$.post('/api/v1/logout').done ->
        controller.set('user', null)
        controller.set('loggedIn', false)
        controller.transitionToRoute('login')

    hideError: ->
      @set('errorMessage', null)

  checkUser: ->
    controller = @
    @store.find('user', 'current').then (user) ->
      controller.set('user', user)
      controller.set('loggedIn', true)
    , (error) ->
      controller.transitionToRoute('login')

}); 