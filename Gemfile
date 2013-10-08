source "https://rubygems.org"
# `source` tells Bundler where to look for gems.
# We use `https` because it provides a measure of
# verification that rubygems.org is, in fact,
# actually rubygems.org

# See http://en.wikipedia.org/wiki/HTTP_Secure
# For more details on the https protocol

# See http://bundler.io/v1.3/gemfile.html
# For more information on Gemfiles



ruby "1.9.3"
# Heroku by default wants you to use ruby 2.0.0
# All of our machines are using ruby 1.9.3;
# so we tell heroku to use ruby 1.9.3

# See https://devcenter.heroku.com/articles/getting-started-with-ruby#specify-ruby-version-and-declare-dependencies-with-a-gemfile
# For more detail



gem 'sinatra'
# Sinatra is the library we're using to define our routes

# See http://www.sinatrarb.com/intro.html
# For their README



group :development, :test do
# Groups allow us to keep gems that we only use for test
# or development off of our production environment

# See https://devcenter.heroku.com/articles/getting-started-with-ruby#runtime-dependencies-on-development-test-gems
# for more details


  gem 'rspec'
  # rspec allows you to write tests for ruby code.

  # See https://relishapp.com/rspec/rspec-core/docs
  # for its documentation


  gem 'capybara'
  # capybara makes it easier to write tests for web applications

  # See https://github.com/jnicklas/capybara
  # for its documentation


  gem 'rerun'
  # Rerun re-launches applications when the file system changes.
  # This makes it easy to re launch sinatra or our tests when we
  # Save a file

  # See https://github.com/alexch/rerun
  # for its documentation
end