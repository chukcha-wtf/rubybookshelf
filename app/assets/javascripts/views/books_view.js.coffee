App.BooksView = Ember.View.extend
  templateName: 'books'

  didInsertElement: ->
    $('#navigation li.books').addClass('active')

  willDestroyElement: ->
    $('#navigation li.books').removeClass('active')
