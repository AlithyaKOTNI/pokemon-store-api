# README

Welcome to Pokemon store

This rails application exposes a REST API to manange Pokemons.

- Before starting the application , execute bin/rails db:migrate then db:seed to populate database from a csv file.
- To test the application with postman, import the file 'Pokemon store.postman_collection.json'  (this file is available at the root folder of the app) into Postman,
  this collection will help you to test all API exposed by the application.
  
- Before runing unit tests, execute rails db:migrate then db:seed RAILS_ENV=test , then run rspec.

Happy testing !!