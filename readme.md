# Statustar: Update Anywhere, Status Everywhere

[![Dependency Status](https://gemnasium.com/doolin/statustar.png)](https://gemnasium.com/doolin/statustar)

Geolocation Status Notifier Application:
[Statustar](http://railstutorial.org/)
by [Dave Doolin](http://tinobox.com/wordpress/)
and [Walter Yu](http://fiveamsoftware.com/)


## Log


#### 2015-02-28

* update all the views to rspec 2.9; file type suffixes are now inferred.
* move rails_upgrade plugin out of vendor/plugins
* 'require: false' on cucumber-rails to silence warning


#### 2015-02-27

* Update to Rails 3.1
* Rspec 2.9.0
* Found template handling deprecation


## TODO

* Get pg running locally for rspec
* (DONE) upgrade to Rails 3.2
* (DONE) upgrade to Rails 3.2.21
* (DONE) upgrade to Rails 4.0
* upgrade to Rails 4.1
* upgrade to Rails 4.2
* add travis.yml to get the build passing on ci

### Views

* (DONE) Fix spec template render deprecation
* (DONE) Fix controller inference specs, change hash key to symbol


### Update Testing

* Move template check to request spec

#### RSpec

The main issue as of 3-20-2015 is that logging in users in certain
specs isn't working, and I don't know why. Here are some things to try:

* See if any other specs require logging in users.
* Find out how many of the specs which fail are due to this signin problem.
* Trace the control of flow manually where signing in works, then trace it
  through the spec to see what's different.

RSpec upgrades:

* (DONE) 2.9
* (DONE) 2.99
* 3.0
* 3.x

Other: 

* remove unneeded and pending specs

#### Cucumber

* update to latest
* remove webrat


#### FactoryBot

* (DONE) 2.0
* (DONE) 3.0
* (DONE) 4.0
* (DONE) 4.5.0
