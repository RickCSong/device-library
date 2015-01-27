source 'https://rubygems.org'

gem 'rails', '4.2'
gem 'custom_configuration'

# MODELS
gem 'mysql2'
gem 'active_model_serializers'

# AUTH
gem 'sq-sso', git: 'https://stash.corp.squareup.com/scm/it/sq-sso-rails.git'

# VIEWS
gem 'slim-rails'
gem 'csv_shaper'

# EMAILS
gem 'roadie-rails'

# CSS
gem 'sass-rails', '~> 4.0.4'
gem 'compass-rails'
gem 'font-awesome-rails'
gem 'autoprefixer-rails'
gem 'bootstrap-square', git: 'https://stash.corp.squareup.com/scm/sq/bootstrap-square.git'

# JAVASCRIPT CORE
gem 'coffee-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'ember-rails'
gem 'ember-source', '~> 1.10.0.beta.4'
gem 'ember-data-source', '~> 1.0.0.beta.14.1'

# JAVASCRIPT LIBRARIES
gem 'select2-rails'
gem 'momentjs-rails'

# OTHERS
gem 'therubyracer', platform: :mri, require: 'v8'
gem 'rails_config'
gem 'whenever'

group :doc do
  gem 'sdoc', require: false
  gem 'yard', require: false
end

group :development do
  gem 'foreman'
end

group :development, :test do
  gem 'cane',               require: false
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'annotate',           require: false
  gem 'mailcatcher',        require: false
  gem 'factory_girl_rails'
end

group :test do
  # Don't require rspec-rails, since we don't want to use the built in tasks.
  gem 'rspec-rails', require: false
  gem 'database_cleaner'
  gem 'shoulda-matchers', require: false
  gem 'spring-commands-rspec'

  # Currently unused
  gem 'poltergeist'
  gem 'capybara',    require: false
  gem 'konacha'
  gem 'sinon-rails'

  # Used for service fakes
  gem 'sinatra', require: false

  gem 'fdoc'
  gem 'simplecov'
end

group :test, :development do
  gem 'rubocop', require: false
  gem 'bullet'
  gem 'timecop'
  gem 'ffaker'
  gem 'pry-rails'
  gem 'pry-nav'
end
