$LOAD_PATH.unshift(File.expand_path('.'))
require 'tasks/rspec'
require 'tasks/environment'

require 'sinatra/activerecord/rake'

# Ensure that we load the environment before doing database stuff
["db:migrate", "db:rollback", "db:schema:dump", "db:schema:load"].each do |task|
  Rake::Task[task].enhance [:environment]
end
