# README

To get this application running you'll need to install:

* Ruby 2.7.2 (recommended using of [Rbenv](https://github.com/rbenv/rbenv#installation))

* psql ([PostgreSQL](https://www.postgresql.org/)) 10.16

After installing Ruby and PostgreSQL, clone this repository to your machine, open the project dir in the terminal and run `gem install bundler` and then `bundle install`.

Be sure the last step go well. Next, run in terminal `rake db:create` and `rake db:setup`.

If everything goes well you're ready to go!

Just run `rails server` to start the server and then access `http://localhost:3000/`.
