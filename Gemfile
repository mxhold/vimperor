source 'https://rubygems.org'

ruby File.read('.ruby-version').chomp

gem 'rails', '4.2.0.beta4'
gem 'pg'
gem 'sass-rails', '~> 5.0.0.beta1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails', '~> 4.0.0.beta2'

gem 'bootstrap-sass', '~> 3.2.0'
gem 'font-awesome-sass', '~> 4.2.0'
gem 'hashids'
gem 'responders'

group :development do
  gem 'web-console', '~> 2.0.0.beta4'
end

group :development, :test do
  gem 'byebug'
  gem 'spring'
end

group :development, :test, :travis do
  gem 'rubocop', require: false
  gem 'rspec-rails', '~> 3.1.0'
  gem 'factory_girl_rails', '~> 4.0'
end

group :test, :travis do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'shoulda-matchers'
  gem 'codeclimate-test-reporter', require: false
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end
