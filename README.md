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

## Style Guide

1.  [Colors](https://kuler.adobe.com/create/color-wheel/?base=2&rule=Triad&selected=1&name=My%20Kuler%20Theme&mode=rgb&rgbvalues=0.5,0.0186274509803922,0.4042725044563877,0.1725490196078432,0.14704249200514974,0.0267643513231999,0.8,0.10980392156862745,0.6627450980392157,0.022352941176470645,0.6000000000000001,0.5778304409240785,0.04362745098039217,0.5,0.48248484428064925&swatchOrder=0,1,2,3,4)

