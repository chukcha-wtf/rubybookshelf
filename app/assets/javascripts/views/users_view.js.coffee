App.UsersView = Ember.View.extend
  templateName: 'users'

  didInsertElement: ->
    Em.$('#navigation li.users').addClass('active')

  willDestroyElement: ->
    Em.$('#navigation li.users').removeClass('active')
