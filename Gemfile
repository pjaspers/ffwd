source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.beta1', '< 5.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Use Puma as the app server
gem 'puma'

# Process manager for applications with multiple components
# [foreman](http://github.com/ddollar/foreman)
gem "foreman", "~> 0.78.0"

# Flexible authentication solution for Rails with Warden
# [devise](http://github.com/plataformatec/devise)
gem "devise", git: "git@github.com:plataformatec/devise.git"

# A generalized Rack framework for multiple-provider authentication.
# [omniauth](http://github.com/intridea/omniauth)
gem "omniauth"

# A simple HTTP and REST client for Ruby, inspired by the Sinatra micro...
# [rest-client](https://github.com/rest-client/rest-client)
gem "rest-client", "~> 1.8.0"

# Use ActiveModel has_secure_password
# gem "bcrypt", "~> 3.1.7"

# Annotates Rails/ActiveRecord Models, routes, fixtures, and others bas...
# [annotate](http://github.com/ctran/annotate_models)
gem "annotate", "~> 2.7.0"

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem "web-console", "~> 3.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "capistrano", "~> 3.4.0"
  gem "capistrano-rails", "~> 1.1.5"
  gem "capistrano-foreman", "~> 1.2.0"
  gem "capistrano-rbenv", "~> 2.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
