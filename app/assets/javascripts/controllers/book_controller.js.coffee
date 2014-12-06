App.BookController = Ember.ArrayController.extend
  book: null
  editing: false

  actions: 
    save: ->
      controller = @
      @get('book').save().then (book)->
        controller.set('editing', false)
        book.reload()
      , (error) ->
        controller.showError(error)

    cancel: ->
      @get('book').rollback()
      @set('editing', false)

    edit: ->
      @set('editing', true)
