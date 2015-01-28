source 'https://rubygems.org'

gem 'rails', '4.2'

# MODELS
gem 'mysql2'

# AUTH
gem 'go_people', git: 'https://stash.corp.squareup.com/scm/it/go_people_rails.git'
gem 'sq-sso', git: 'https://stash.corp.squareup.com/scm/it/sq-sso-rails.git'

# VIEWS
gem 'csv_shaper'
gem 'jbuilder'

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
gem 'whenever'

group :doc do
  gem 'sdoc', require: false
  gem 'yard', require: false
end

group :development, :test do
  gem 'annotate',           require: false
  gem 'factory_girl_rails'
  gem 'rubocop', require: false
  gem 'timecop'
  gem 'pry-rails'
  gem 'pry-nav'
end

group :test do
  # Don't require rspec-rails, since we don't want to use the built in tasks.
  gem 'rspec-rails', require: false
  gem 'shoulda-matchers', require: false
  gem 'spring-commands-rspec'

  gem 'fdoc'
  gem 'simplecov'
end
