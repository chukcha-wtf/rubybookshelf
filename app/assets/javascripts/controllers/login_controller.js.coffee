App.LoginController = Ember.ArrayController.extend
	loggedIn: false,
	email: null,
	password: null,
	users: [],
	errorMessage: null,
	
	actions:
		login: ->
			controller = @

			Em.$.ajax
				url: '/api/v1/login'
				type: "POST"
				data: {email: @get('email'), password: @get('password')}
				success: (data) ->
					controller.set('user', data)
					controller.set('loggedIn', true)
				error: (xhr, status, error) ->
					controller.set('errorMessage', error);

		logout: ->
			Em.$.ajax
				url: '/api/v1/logout'
				type: "POST"
				success: (data) ->
					console.log(data)
				error: (xhr, status, error) ->
					controller.set('errorMessage', error);

		fetchUsers: ->
			controller = @

			Em.$.ajax
				url: '/api/v1/users'
				type: 'GET',
				success: (data) ->
					controller.set('users', data)
				error: (xhr, status, error) ->
					controller.set('errorMessage', error);

