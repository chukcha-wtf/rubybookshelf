Ember.Handlebars.registerHelper "canEditRecord", (context, options) ->
  self = @
  switch
    when !jQuery.isEmptyObject self.book
      user = self.book.get('user')
    when !jQuery.isEmptyObject self.author
      user = self.author.get('user')
    when !jQuery.isEmptyObject self.user
      user = self.user

  if user.get('isAdmin')
    options.fn(@)
  else
    if user.get('isUser')
      tuid = user.get('id')
      if App.currentUser
        cuid = App.currentUser.get('id')
      else
        cuid = "0"

      if tuid == cuid
        options.fn(@)
      else
        options.inverse(@)
    else
      options.inverse(@)

Ember.Handlebars.registerHelper "ifCanCreateRecord", (context, options) ->
  self = @

  if App.currentUser
    if App.currentUser.get('isAdmin') || App.currentUser.get('isUser')
      options.fn(@)
    else
      options.inverse(@)
