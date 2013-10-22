get '/auth/:provider/callback' do
  user = login_from_omniauth(env['omniauth.auth'])
  # Omniauth provides a hash full of data about the user
  # It's available in env['omniauth.auth']
end
