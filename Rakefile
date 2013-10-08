begin
# Because rspec isn't installed in heroku, we want to prevent
# requireing rspec from crashing our application

# See https://devcenter.heroku.com/articles/getting-started-with-ruby#rakefile
# For why Heroku wants this

# See http://rubylearning.com/satishtalim/ruby_exceptions.html
# for information on exception handling


  require "rspec/core/rake_task"
  desc "Run all examples"
  RSpec::Core::RakeTask.new(:spec)
  # Here we're creating a rake task to run all of our specs

  # See https://www.relishapp.com/rspec/rspec-core/docs/command-line/rake-task
  # For details on rspec/core/rake_task

  # See http://rake.rubyforge.org/#documentation
  # For information on Rake and Rake Tasks


  task :default => :spec
  # We want rake to run specs if we run rake without arguments

  # See "The Default Task" here: http://jasonseifer.com/2010/04/06/rake-tutorial#The-Default-Task
  # For more information on default tasks and rake

rescue LoadError
  # LoadError gets raised when `require` is called and it cannot find
  # the file that is being required.

  # Because we don't install the rspec gem on heroku
  # We expect LoadErrors to be raised when we run Rake on heroku.
  # The `rescue` command is a way to catch those errors
  # and handle them gracefully.

  # See http://rubylearning.com/satishtalim/ruby_exceptions.html
  # for information on exception handling
end