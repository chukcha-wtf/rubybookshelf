# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  @resource('login', {path: '/'})
  @resource('books')
  @resource('authors')