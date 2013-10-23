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
require 'initializers/omniauth'
require 'initializers/activerecord'
require 'initializers/helpers'

['models', 'routes'].each do |directory_to_preload|
  Dir["#{directory_to_preload}/*.rb"].each do |file_to_load|
    require file_to_load
  end
end


require 'collectors/collects_talks_for_rendering'
