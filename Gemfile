source 'https://rubygems.org'

ruby '~> 2.6.5'

gem 'actionmailer-text', '>= 0.1.1'
gem 'active_model_serializers', '>= 0.10.12'
gem 'active_record_upsert'
gem 'acts_as_paranoid'
gem 'aws-sdk-s3', require: false
gem 'bundler'
gem 'colorize'
gem 'devise', '~> 4.7.3'
gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'
gem 'enum_help'
gem 'figaro'
gem 'httparty'
gem 'identity-hostdata', git: 'https://github.com/18F/identity-hostdata.git', branch: 'master'
gem 'identity-logging', git: 'https://github.com/18f/identity-logging.git', tag: 'v0.1.0'
gem 'identity_validations', git: 'https://github.com/18f/identity-validations.git', branch: 'master'
gem 'jquery-rails', '>= 4.4.0'
gem 'json-jwt', '>= 1.13.0'
gem 'jwt'
gem 'lograge'
gem 'newrelic_rpm', '>= 6.14.0'
gem 'nokogiri', '~> 1.11', '>= 1.11.0'
gem 'omniauth-rails_csrf_protection', '~> 0.1', '>= 0.1.2'
gem 'omniauth_login_dot_gov', git: 'https://github.com/18f/omniauth_login_dot_gov.git'
gem 'paper_trail', '~> 11.0'
gem 'pg'
gem 'pry-rails'
gem 'pundit', '>= 2.1.0'
gem 'rack-canonical-host'
gem 'rails', '~> 6.1.2'
gem 'recipient_interceptor'
gem 'responders', '~> 3.0', '>= 3.0.1'
gem 'rest-client', '~> 2.1'
gem 'ruby_regex'
gem 'sass-rails', '~> 6.0', '>= 6.0.0'
gem 'secure_headers', '~> 3.9'
gem 'simple_form', '~> 5.0', '>= 5.0.3'
gem 'slim-rails', '~> 3.2', '>= 3.2.0'
gem 'subprocess', require: false
gem 'uglifier'
gem 'webpacker', '~> 5.2', '>= 5.2.1'

group :deploy do
  gem 'capistrano'
  gem 'capistrano-npm'
  gem 'capistrano-passenger'
  gem 'capistrano-rails'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bummr', require: false
  gem 'listen', '~> 3.3'
  gem 'rubocop', '=1.6'
  gem 'rubocop-rspec'
  gem 'web-console', '>= 4.1.0'
end

group :development, :test do
  gem 'bullet'
  gem 'factory_bot_rails', '~> 6.1', '>= 6.1.0'
  gem 'i18n-tasks', '>= 0.9.31'
  gem 'pry-byebug'
  gem 'puma'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
  gem 'saml_idp', git: 'https://github.com/18F/saml_idp.git', branch: 'master'
  gem 'slim_lint'
end

group :test do
  gem 'axe-matchers'
  gem 'capybara-selenium', '>= 0.0.6'
  gem 'climate_control'
  gem 'codeclimate-test-reporter', require: nil
  gem 'database_cleaner'
  gem 'fakefs', require: 'fakefs/safe'
  gem 'rack_session_access'
  gem 'rails-controller-testing', '>= 1.0.5'
  gem 'shoulda-matchers'
  gem 'simplecov', '= 0.17.0'
  gem 'sinatra', '>= 2.1.0'
  gem 'timecop'
  gem 'webdrivers', '~> 4.4', '>= 4.4.1'
  gem 'webmock'
  gem 'websocket-driver', '= 0.7.3'
end

group :production do
  gem 'rack-timeout'
  gem 'rails_serve_static_assets'
end

gem 'autoprefixer-rails', '~> 10.1'
