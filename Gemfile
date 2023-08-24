source 'https://rubygems.org'

ruby '~> 2.6.5'

gem 'actionmailer-text', '>= 0.1.1'
gem 'active_model_serializers', '>= 0.10.13'
gem 'active_record_upsert', '>= 0.10.1'
gem 'acts_as_paranoid', '>= 0.7.1'
gem 'aws-sdk-s3', require: false
gem 'aws-sdk-eventbridge', require: false
gem 'bundler'
gem 'colorize'
gem 'devise', '~> 4.8.0'
gem 'dotenv-rails', '~> 2.8', '>= 2.8.0'
gem 'enum_help', '>= 0.0.18'
gem 'faraday'
gem 'identity-hostdata', git: 'https://github.com/18F/identity-hostdata.git', tag: 'v3.3.0'
gem 'identity-logging', git: 'https://github.com/18f/identity-logging.git', tag: 'v0.1.0'
gem 'identity_validations', git: 'https://github.com/18f/identity-validations.git', tag: 'v0.6.0'
gem 'jquery-rails', '>= 4.5.0'
gem 'json-jwt', '>= 1.14.0'
gem 'jwt'
gem 'kaminari', '>= 1.2.2'
gem 'lograge', '>= 0.12.0'
gem 'newrelic_rpm', '>= 6.14.0'
gem 'nokogiri', '~> 1.11'
gem 'omniauth_login_dot_gov', git: 'https://github.com/18f/omniauth_login_dot_gov.git'
gem 'omniauth-rails_csrf_protection', '~> 1.0', '>= 1.0.0'
gem 'paper_trail', '~> 12.0', '>= 12.0.0'
gem 'pg'
gem 'pry-rails'
gem 'pundit', '>= 2.1.1'
gem 'rack-canonical-host'
gem 'rack-timeout', require: false
gem 'rails', '~> 6.1.7', '>= 6.1.7.5'
gem 'recipient_interceptor'
gem 'redacted_struct'
gem 'responders', '~> 3.1', '>= 3.1.0'
gem 'rest-client', '~> 2.1'
gem 'ruby_regex'
gem 'sass-rails', '~> 6.0', '>= 6.0.0'
gem 'secure_headers', '~> 3.9'
gem 'simple_form', '~> 5.1', '>= 5.1.0'
gem 'subprocess', require: false
gem 'uglifier'
gem 'webpacker', '~> 5.2', '>= 5.2.2'

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
  gem 'web-console', '>= 4.2.0'
end

group :development, :test do
  gem 'bullet', '>= 6.1.4'
  gem 'factory_bot_rails', '~> 6.2', '>= 6.2.0'
  gem 'i18n-tasks', '>= 0.9.34'
  gem 'pry-byebug'
  gem 'puma'
  gem 'rspec-rails', '~> 4.1', '>= 4.1.0'
  gem 'rubocop', '~> 1.11.0'
  gem 'rubocop-rails', '~> 2.6.0'
  gem 'rubocop-rspec'
  gem 'saml_idp', git: 'https://github.com/18F/saml_idp.git', tag: '0.11.0.18f'
end

group :test do
  gem 'axe-matchers'
  gem 'capybara-selenium', '>= 0.0.6'
  gem 'codeclimate-test-reporter', require: nil
  gem 'database_cleaner'
  gem 'fakefs', require: 'fakefs/safe'
  gem 'rack_session_access'
  gem 'rails-controller-testing', '>= 1.0.5'
  gem 'shoulda-matchers', '>= 4.5.0'
  gem 'simplecov', '= 0.17.0'
  gem 'sinatra', '>= 2.1.0'
  gem 'timecop'
  gem 'webdrivers', '~> 4.4', '>= 4.4.1'
  gem 'webmock'
  gem 'websocket-driver', '= 0.7.3'
end

group :production do
  gem 'rails_serve_static_assets'
end

gem 'autoprefixer-rails', '~> 10.1'
