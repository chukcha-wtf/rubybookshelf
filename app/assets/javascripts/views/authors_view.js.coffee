App.AuthorsView = Ember.View.extend
  templateName: 'authors'

  didInsertElement: ->
    Em.$('#navigation li.authors').addClass('active')

  willDestroyElement: ->
    Em.$('#navigation li.authors').removeClass('active')
