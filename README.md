# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

1- we can use "faker" gem to make random auto-generated password as initial password

2- we can use "mandrill" gem to send unique token for each repairer and send them email to modify/update their form

3- to ensure that the repairer agrees to the terms, we can add a checkbox in their form and make it boolean

4- if he refuses the terms, the form will not be saved and vice versa.

5- Also there is a gem called "terms_acceptance" provides customizable terms features in rails app

6- finally,we can use two routes for both registration form sent and registration form token to avoid the conflict between them

7- Thats all, please check every single step written above and make your decision
