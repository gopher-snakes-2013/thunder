# config.ru is what's known as a `rackup` file. It's a configuration
# file for rack-compliant servers so they can execute rack-compliant
# applications. Sinatra is a rack-compliant framework; so it plays
# quite nicely with any number of hosting platforms.

# See https://devcenter.heroku.com/articles/rack#sinatra
# For information on a variety of rack-compliant frameworks

# See http://www.sinatrarb.com/intro.html#When%20to%20use%20a%20config.ru?
# for information on why to use config.ru

# See http://codefol.io/posts/14--What-is-Rack-A-Primer
# for information on what Rack is.

require './thunder_app'
run Sinatra::Application
# `run` is a Rack method that tells the rack server to dispatch HTTP Requests
# to the rack application specified.

# See http://rack.rubyforge.org/doc/Rack/Builder.html
# For the documentation on Rack.

# Sinatra::Application is the central class of sinatra.
# It makes the pieces of your sinatra work together to serve web pages We can
# use it here because we have required thunderapp.rb
# thunderapp.rb then requires sinatra, which defines Sinatra::Application

# See https://github.com/sinatra/sinatra/blob/master/lib/sinatra/main.rb#L3
# For the code behind Sinatra::Application
