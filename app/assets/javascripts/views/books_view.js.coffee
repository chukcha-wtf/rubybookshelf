App.BooksView = Ember.View.extend
  templateName: 'books'

  didInsertElement: ->
    Em.$('#navigation li.books').addClass('active')

  willDestroyElement: ->
    Em.$('#navigation li.books').removeClass('active')
