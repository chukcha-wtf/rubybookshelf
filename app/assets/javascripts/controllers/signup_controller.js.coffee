App.SignupController = Ember.ArrayController.extend
  email: null
  password: null
  fullname: null
  password_confirmation: null

  actions:
    signup: ->
      controller = @

      data = {"user": {}}
      user = data['user']
      user['email'] = @get('email')
      user['fullname'] = @get('fullname')
      user['password'] = @get('password')
      user['password_confirmation'] = @get('password_confirmation')

      if user['password'] == user['password_confirmation']
        Em.$.post('/api/v1/users', data).done(->
          controller.transitionToRoute 'login'
        ).fail((error)->
          controller.showError(error)
        )
      else
        @showError("Your passwords doesn't match")

