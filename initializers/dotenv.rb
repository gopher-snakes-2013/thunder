begin
  require 'dotenv'
  Dotenv.load(".env.#{ENV['RACK_ENV']}", ".env")
rescue LoadError
end
