get '/auth/:provider/callback' do
  user = user_from_authhash(env['omniauth.auth'])
  login(user)
  redirect '/'
end
