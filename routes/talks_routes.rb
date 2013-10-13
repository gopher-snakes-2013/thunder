get '/' do
# This tells sinatra to define a get route at the '/' path.
# If you use shotgun to run the app
  @talks = Talk.all
  erb :index
  # This tells sinatra to load the embedded ruby file in views named index.erb
  # It loads the file, interprets it, and returns the output as a string.

  # See http://ruby-doc.org/stdlib-1.9.3/libdoc/erb/rdoc/ERB.html
  # For details on the ERB class

  # See http://www.sinatrarb.com/intro.html#Views%20/%20Templates
  # For how Sinatra works with templates and views

end
post "/talks" do
  current_user.suggest_talk(params[:talk])
  redirect "/"
end

post "/talks/:id/claim" do
  current_user.claim_talk(Talk.find(params[:id]))
  redirect "/"
end
