App.BooksRoute = Ember.Route.extend({
  model: (params) ->
  setupController: (controller, model) ->
    @store.find('book').then (data)->
      controller.set('books', data)
    , (error) ->
      controller.showError(error)
  renderTemplate: ->
    r = @
    if App.currentUser
      r.render()
    else
      setTimeout ->
        r.render()
      , 200
})  