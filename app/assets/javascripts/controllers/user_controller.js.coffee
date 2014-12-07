App.UserController = Ember.ArrayController.extend
  user: null
  editing: false
  roles: ['guest', 'user', 'admin']

  actions: 
    save: ->
      controller = @
      @get('user').save().then (user)->
        controller.set('editing', false)
        user.reload()
      , (error) ->
        controller.showError(error)

    cancel: ->
      @get('user').rollback()
      @set('editing', false)

    edit: ->
      @set('editing', true)

    delete: ->
      @get('user').destroyRecord()
      @transitionToRoute 'users'
