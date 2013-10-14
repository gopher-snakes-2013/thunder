# Thunder

Thunder is a lightning talk scheduler designed to make it easy to
recommend and volunteer for talks

## Running the App

1. Clone it/Update it
1. `bundle`
1. `createdb thunder_dev` # Create the postgres database
1. `rake db:migrate`      # Ensure the database is up to date
1. `rackup`               # Or your rack-compliant server of choice

## Running the tests

1. `createdb thunder_test`
1. `RACK_ENV=test rake db:migrate`
1. `rake`

## Contributing

1. Grab a feature or bugfix off [Trello](https://trello.com/b/rlTdOUOo/thunder)
   and submit a pull request!
1. Submit an [issue](issues)!
