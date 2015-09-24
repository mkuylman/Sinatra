require_relative 'frank'
map('/') { run WelcomesController }
map('/users') { run UsersController }
map('/sessions') { run SessionsController }
map('/posts') { run PostsController }