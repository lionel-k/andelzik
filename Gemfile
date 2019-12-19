# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.4'

gem 'appsignal'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'faker', '~> 1.9.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'
gem 'rails', '~> 5.2.2', '>= 5.2.2.1'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner', '~> 1.7.0'
  gem 'factory_bot_rails'
  gem 'rspec-its', '~> 1.2.0'
  gem 'rspec-rails', '~> 3.6.0'
  gem 'shoulda-matchers'
  gem 'simplecov', '~> 0.16.1', require: false
end

group :development do
  gem 'guard', '~> 2.15.0'
  gem 'guard-rubocop', '~> 1.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
