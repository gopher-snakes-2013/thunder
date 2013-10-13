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
