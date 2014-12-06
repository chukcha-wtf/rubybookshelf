App.LoginController = Ember.ArrayController.extend
	loggedIn: false,
	email: null,
	password: null,
	users: [],
	books: [],
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
					controller.send('fetchUsers');
					controller.set('loggedIn', true)
				error: (xhr, status, error) ->
					controller.set('errorMessage', error);

		logout: ->
			Em.$.ajax
				url: '/api/v1/logout'
				type: "POST"
				success: (data) ->
				error: (xhr, status, error) ->
					controller.set('errorMessage', error);

		fetchUsers: ->
			controller = @

			controller.set('users', controller.store.find('user'));

		fetchBooks: ->
			controller = @

			controller.set('books', controller.store.find('book'));

		fetchAuthors: ->
			controller = @

			controller.set('authors', controller.store.find('author'));
