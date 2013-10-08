$LOAD_PATH.unshift(File.expand_path('.'))
# The $LOAD_PATH array includes all the places ruby will look when
# you call require.

# We want to add the current working directory
# to the loadpath so that we can require our files
# without using require_relative

# See http://selfless-singleton.rickwinfrey.com/2012/12/20/-rubys-load-path/
# For more details

require 'thunder_app'
# Because we added the $LOAD_PATH, we can now require 'thunder_app'
# without doing `require_relative` or `require './thunder_app'

require 'capybara/rspec'
# Capybara allows us to test web applications easily. Let's load the library!

# See https://github.com/jnicklas/capybara#using-capybara-with-rspec
# For more details


Capybara.app = Sinatra::Application
# Capybara needs to know which application to test.
# By setting the app attribute to Sinatra::Application
# We're telling Capybara to test the application in thunder_app.rb

# See https://github.com/jnicklas/capybara#setup
# For more details on what Capybara.app does

# Sinatra::Application is a class represents the application you're building.
# This is using what's known as sinatra `classic` style.


# See http://www.sinatrarb.com/intro.html#Modular%20vs.%20Classic%20Style
# For comparison of classic vs modular sinatra styles