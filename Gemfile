source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

group :development, :test do
  gem 'faker'
  gem 'pry-meta'
  gem 'pry-rails'
  # Rspec for tests
  gem 'rspec-rails'
  # Factory for development
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'

  # For line command debug
  gem 'pry-byebug'
end

group :development do
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
end

gem 'panko_serializer'
gem 'pdfkit'
# Figaro for managing ENV vabiables
gem 'figaro'

# AWS S3
gem 'aws-sdk-s3'
