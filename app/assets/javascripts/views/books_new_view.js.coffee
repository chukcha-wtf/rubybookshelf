App.BooksNewView = Ember.View.extend
  templateName: 'books/new'

  didInsertElement: ->
    $('#navigation li.books').addClass('active')

  willDestroyElement: ->
    $('#navigation li.books').removeClass('active')
