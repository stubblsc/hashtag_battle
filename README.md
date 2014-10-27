Hashtag Battle
==============
Scott Stubblebine

Introduction
------------
This is an app that allows you to track the activity of different hashtags or
other search terms on twitter, for example #ruby and #rails. After inputting
two hashtags, it will track the count of each individual hashtag, as well as
the twitter posts that the hashtags are used in. You can also view previous
battles that have been performed and an overview of the ending state of the
battle.

Ruby version
------------
This app uses ruby -v 2.1.3p242 and rails -v 4.1.6.

System dependencies
-------------------
The following gems are required, in addition to those that come standard in a
rails app:
  * mysql2
  * [twitter](https://github.com/sferik/twitter)
  * [twitter-bootstrap-rails](https://github.com/seyhunak/twitter-bootstrap-rails)

Configuration
-------------
Run the following commands in terminal to configure the application:
  * `bundle install`
  * `rake routes`

Database creation
-----------------
The app uses a MySQL database. Use the following commands in terminal to create
the database:
  * `rake db:create`
  * `rake db:migrate`

Use the following command to destroy and rebuild the database:
  * `rake db:reset`
