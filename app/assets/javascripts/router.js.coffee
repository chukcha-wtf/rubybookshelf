App.Router.map ()->
  @resource('books', {path: '/books'}, (->
    @route('new', {path: '/new'})
  ))
  @resource('book', {path: '/books/:book_id'})
  @resource('authors', {path: '/authors'}, (->
    @route('new', {path: '/new'})
  ))
  @resource('author', {path: '/authors/:author_id'})
  @resource('users', {path: '/users'})
  @resource('user', {path: '/users/:user_id'})
  @route('login', {path: '/'})
  @route('signup', {path: '/signup'})