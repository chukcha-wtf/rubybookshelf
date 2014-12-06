Ember.ControllerMixin.reopen({
  errorMessage: ''

  showError: (message) ->
    text = $.parseJSON(message.responseText)
    if jQuery.isEmptyObject(text)
      App.__container__.lookup('controller:header').set('errorMessage', text)
    else
      App.__container__.lookup('controller:header').set('errorMessage', text['message'])
})