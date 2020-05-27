# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', '~> 1.1', '>= 1.1.1'

# A Ruby gem to load environment variables from `.env`.
gem 'dotenv', '~> 2.7', '>= 2.7.5'

# Object oriented authorization for Rails applications
gem 'pundit', '~> 2.1'

# Flexible authentication solution for Rails with Warden
gem 'devise', '~> 4.7', '>= 4.7.1'

# JWT authentication for devise with configurable token revocation strategies
gem 'devise-jwt', '~> 0.6.0'

group :development, :test do
  # A runtime developer console and IRB alternative with powerful introspection capabilities. http://pry.github.com
  gem 'pry', '~> 0.13.1'

  # Automatic Ruby code style checking tool. Aims to enforce the community-driven Ruby Style Guide.
  gem 'rubocop', '~> 0.83.0', require: false

  # Great Ruby dubugging companion: pretty print Ruby objects to visualize their structure.
  # Supports custom object formatting via plugins
  gem 'awesome_print', '~> 1.8'

  # rspec-rails is a testing framework for Rails 5+.
  gem 'rspec-rails', '~> 4.0'

  # factory_bot provides a framework and DSL for defining and using factories - less error-prone,
  # more explicit, and all-around easier to work with than fixtures.
  gem 'factory_bot_rails', '~> 5.2'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Annotates Rails/ActiveRecord Models, routes, fixtures, and others based on the database schema.
  gem 'annotate', '~> 3.1', '>= 3.1.1'

  # When mail is sent from your application, Letter Opener will open a preview in the browser instead of sending.
  gem 'letter_opener', '~> 1.7'

  # help to kill N+1 queries and unused eager loading.
  gem 'bullet', '~> 6.1'

  gem 'listen', '~> 3.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
