App.Router.map ()->
  @resource('books', {path: '/books'}, (->
    @resource('book', {path: '/:book_id'})
    @resource('new', {path: '/new'})
  ))
  @resource('authors', {path: '/authors'}, (->
    @resource('author', {path: '/:author_id'})
    @resource('new', {path: '/new'})
  ))
  @resource('users', {path: '/users'}, (->
    @resource('user', {path: '/:user_id'})
  ))
  @route('login', {path: '/'})
  @route('signup', {path: '/signup'})