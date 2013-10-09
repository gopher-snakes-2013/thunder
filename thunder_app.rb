require 'sinatra'

require 'rack-flash'
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

require 'models/user'
require 'helpers/session_helper'

helpers do
  include SessionHelper
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
  @user = User.new
  erb "users/new".to_sym
end

post '/users' do
  @user = User.create(params[:user])
  if @user.valid?
    login(@user)
    flash[:notice] = "Thanks for registering, #{params[:user][:name]}!"
    redirect '/'
  else
    erb "users/new".to_sym
  end
end

get "/sessions/new" do
  erb "sessions/new".to_sym
end

get "/sessions/delete" do
  log_out
  flash[:notice] = "You have successfully logged out"
  redirect "/"
end

post "/sessions" do
  @user = User.authenticate(params[:user])
  if @user
    login(@user)
    redirect '/'
  else
    erb "sessions/new".to_sym
  end
end
