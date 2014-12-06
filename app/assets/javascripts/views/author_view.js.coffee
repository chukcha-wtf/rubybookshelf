App.AuthorView = Ember.View.extend
  templateName: 'author'

  didInsertElement: ->
    Em.$('#navigation li.authors').addClass('active')

  willDestroyElement: ->
    Em.$('#navigation li.authors').removeClass('active')
