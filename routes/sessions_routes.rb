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

  if @user
  #if a user exists it will be truthy and pass

    login(@user)
    redirect '/'
  else
    @email = params[:user][:email]
    flash[:error] = "No user is registered with that email and password combination"
    erb "sessions/new".to_sym
  end
end
