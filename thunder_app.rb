require 'sinatra'

require 'rack-flash'
require 'bcrypt'

enable :sessions
use Rack::Flash


$LOAD_PATH.unshift(File.expand_path('.'))
# The $LOAD_PATH array includes all the places ruby will look when
# you call require.

# We want to add the current working directory
# to the loadpath so that we can require our files
# without using require_relative

# See http://selfless-singleton.rickwinfrey.com/2012/12/20/-rubys-load-path/
# For more details

require 'initializers/dotenv'
require 'initializers/activerecord'
# We have required these initializers to seperate concerns
# The actual require sintra/activerecord statement have moved this folder

require 'models/user'
# We would like some models, specificly user models to be seen by our app
require 'helpers/session_helper'
# This makes the module located at helpers/sessions_helper availiable
# We will tell sinatra it is a helper below

helpers do
  # helpers is a sinatra method
  # Views automatically have access to all helper methods.
  # Routes, views, and helpers all have access to the same methods
  # and instance variables.
  include SessionHelper
  # we can only include this here because it is required around line 28
  # with: require 'helpers/session_helper'
end

get '/' do
# This tells sinatra to define a get route at the '/' path.
# If you use shotgun to run the app

  erb :index
  # This tells sinatra to load the embedded ruby file in views named index.erb
  # It loads the file, interprets it, and returns the output as a string.

  # See http://ruby-doc.org/stdlib-1.9.3/libdoc/erb/rdoc/ERB.html
  # For details on the ERB class

  # See http://www.sinatrarb.com/intro.html#Views%20/%20Templates
  # For how Sinatra works with templates and views

end


get '/users/new' do
  # for the route root_path/users/new do
  @user = User.new
  # set the instance variable (which can be seen from the view)
  # to be a new instance of the User class
  # from your database models
  erb :"users/new"
  # the erb method expects the shape of it's input to be a symbol.
  # because our views are in subdirectories we are stating the path
  # then coverting it to be a symbol
end

post '/users' do
  @user = User.create(params[:user])
  if @user.valid?
    login(@user)
    flash[:notice] = "Thanks for registering, #{params[:user][:name]}!"
    # flashes are similar to params but are only persistant
    # across a single page load
    # These are nice for notices, and less prone to security issues
    redirect '/'
    # after doing that stuff above take us to the root directory
  else
    erb "users/new".to_sym
  end
end

get "/sessions/new" do
  erb "sessions/new".to_sym
end

get "/sessions/delete" do
  log_out
  # this is a method from our helper
  flash[:notice] = "You have successfully logged out"
  redirect "/"
end

post "/sessions" do
  @user = User.authenticate(params[:user])
  # check the user model to see the authenticate method
  if @user #if a user exists it will be truthy and pass
    login(@user)
    redirect '/'
  else
    @email = params[:user][:email]
    flash[:error] = "No user is registered with that email and password combination"
    erb "sessions/new".to_sym
  end
end
