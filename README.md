# README

### Setup Instructions

First, [request an API key from propublica](https://www.propublica.org/datastore/api/propublica-congress-api)

1. `bundle install`
2. `bundle exec figaro install`
3. add `govt_api_key: <your api key>` to `application.yml`
4. `rails db:create`
5. `rails db:migrate`
