App.LoginController = Ember.ArrayController.extend
  needs: ['header']
  user: Ember.computed.alias("controllers.header.user")
  email: null
  password: null

  observeUser: (->
    @transitionToRoute('books') if @get('user')
  ).observes('user')
  
  actions:
    login: ->
      controller = @

      Em.$.post('/api/v1/login', {email: @get('email'), password: @get('password')}).done(->
        App.__container__.lookup('controller:header').checkUser()
        controller.transitionToRoute 'books'
      ).fail((error)->
        controller.showError(error)
      )
