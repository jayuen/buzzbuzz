# README

An REST API, socket.io server, and a sample client that can be used as a buzzer.

## Start up the API server

1. `bundle`
2. `rails s`

## Start up the socket.io server

1. `cd realtime`
2. `npm install`
3. `npm start`

## Buzzing Via API

Use the Postman collections here `spec/support/postman` for endpoints

1. Create a new buzz session (e.g. POST to `/buzz_sessions`)
2. Buzz in (e.g. POST to `/buzzes` and send in the `name` param to identify yourself)

## Via UI

TBD

## Running tests

Run `rake` to run the tests

## Sources

1. https://github.com/liamks/rails-realtime
