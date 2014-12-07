App.BooksNewController = Ember.ArrayController.extend({
  book: null
  authors: []

  actions:
    save: ->
      controller = @
      @get('book').save().then (book)->
        book.reload()
        controller.transitionToRoute 'books'
      , (error) ->
        controller.showError(error)

    cancel: ->
      @store.unloadAll 'book'
      @transitionToRoute 'books'


  prepareBook: ->
    @set('book', @store.createRecord('book'))
    @set('authors', @store.find('author'))
})