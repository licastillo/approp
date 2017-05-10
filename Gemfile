source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby '2.3.1'
gem 'rails', '~> 5.0.2'
gem 'puma', '~> 3.0'

gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails'

gem 'jbuilder', '~> 2.5'
gem 'money-rails'

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap-sass'
gem 'devise'
gem 'devise-i18n'
gem 'high_voltage'
gem 'pg'

gem 'google_places'

gem 'omniauth'
gem 'omniauth-facebook'
gem "omniauth-google-oauth2"

gem 'carrierwave'
gem 'impressionist'

gem 'geocoder'

group :development do
  gem 'capistrano', '~> 3.7', '>= 3.7.1'
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-passenger', '~> 0.2.0'
  gem 'capistrano-rvm'
  gem 'awesome_print', require: 'ap'
  gem "better_errors"
  gem "binding_of_caller"
  gem "airbrussh", :require => false #Capistrano formatter
  gem "faker"

  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'dotenv-rails'
end

group :development, :test do
  gem 'rubocop'
  gem 'byebug', platform: :mri
end

