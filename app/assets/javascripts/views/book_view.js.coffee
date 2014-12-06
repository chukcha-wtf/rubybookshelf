App.BookView = Ember.View.extend
  templateName: 'book'

  didInsertElement: ->
    Em.$('#navigation li.books').addClass('active')

  willDestroyElement: ->
    Em.$('#navigation li.books').removeClass('active')
