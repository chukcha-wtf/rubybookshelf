App.UserView = Ember.View.extend
  templateName: 'user'

  didInsertElement: ->
    Em.$('#navigation li.users').addClass('active')

  willDestroyElement: ->
    Em.$('#navigation li.users').removeClass('active')
