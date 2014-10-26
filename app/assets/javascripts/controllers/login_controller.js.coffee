App.LoginController = Ember.ArrayController.extend
	loggedIn: false
	greetingText:(->
		if @.get('loggedIn') then "Logged in user" else "Please log in"
	).property()
	
	actions:
		login: ->
			alert('Tried to login')
