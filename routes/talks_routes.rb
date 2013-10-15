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

before %r{\/talks\/(\d+)} do
  @talk = Talk.find(params[:captures].first)
end
post "/talks/:id/claim" do
  current_user.claim_talk(@talk)
  redirect "/"
end

get "/talks/:id/notes/new" do
  @note = @talk.notes.new
  erb "talks/new_note".to_sym
end

post "/talks/:id/notes" do
  note = @talk.notes.new(params[:note])
  note.author = current_user
  note.save
  redirect "/talks/#{params[:id]}"
end

get "/talks/:id" do
  erb "talks/show".to_sym
end
