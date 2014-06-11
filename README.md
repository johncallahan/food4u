A simple Heroku-deployable site (Rails & Postgres free developer's
version) of a restaurant listing site for personal use.

# Installation (Heroku)

You'll need a Heroku account and the toolbelt installed first at
https://toolbelt.heroku.com/

```shell
% git clone https://github.com/johncallahan/food4u.git
% cd food4u
% heroku create
% git push heroku master
% heroku run rake db:migrate
% heroku open
```

Register your first user.  After entering the user's email, password
(twice) and pressing submit, you will be asked if you want to enable
Two-Factor Authentication (2FA).  If you want enhanced security, scan
the QRCode using an app like Google Authenticator first, then click
the checkbox to proceed.  Otherwise, don't click the checkbox.  You
can always enable 2FA later.

You may also consider disabling further registrations and password
recovery by editing the app/models/user.rb file.  Switch the comment
on the 5th and 6th lines from:

```ruby
class User < ActiveRecord::Base
        attr_accessor :gauth_token
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :google_authenticatable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  # devise :google_authenticatable, :database_authenticatable, :trackable, :validatable
end
```

to:

```ruby
class User < ActiveRecord::Base
        attr_accessor :gauth_token
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :google_authenticatable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  devise :google_authenticatable, :database_authenticatable, :trackable, :validatable
end
```

in order to disable user registration, password recovery, etc.  Then,
commit (locally) and deploy the changes as follows:

```shell
git commit -a -m "disable registration, recovery, etc"
git push heroku master
herok open
```

You should no longer see the registration and "forgot password" links
on the login page.

# Updates

```shell
git pull
```

# Installation (Local)

TBD

# Testing (using RSpec and Capybara)

```shell
% bundle exec rake spec
```

# Dependencies

See the Gemfile for the complete list.

* Ruby 2.1 / Rails 4.0.0
* Postgres (free)
* Leaflet
* Devise (with Google Authentication)
