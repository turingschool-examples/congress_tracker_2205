# README

### Setup Instructions

First, [request an API key from propublica](https://www.propublica.org/datastore/api/propublica-congress-api)

1. `bundle install`
2. `bundle exec figaro install`
3. add `govt_api_key: <your api key>` to `application.yml`
4. `rails db:create`
5. `rails db:migrate`

Note: running `bundle exec figaro install` will create a hidden `application.yml` file in the `config` directory. If you don't see this file in your text editor, 
you may need to navigate to this directory to open the file from your command line.

1. `cd config`
2. `ls -la` should show the new `application.yml` file
3. `atom application.yml` (or the equivalent command for your text editor)
4. `cd ..` to return to the root directory of your app
