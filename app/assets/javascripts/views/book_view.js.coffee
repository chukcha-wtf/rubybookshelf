App.BookView = Ember.View.extend
  templateName: 'authors'

  didInsertElement: ->
    Em.$('#navigation li.books').addClass('active')

  willDestroyElement: ->
    Em.$('#navigation li.books').removeClass('active')
