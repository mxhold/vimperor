source 'https://rubygems.org'

ruby File.read('.ruby-version').chomp

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0.beta1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.0.beta1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Rails Html Sanitizer for HTML sanitization
gem 'rails-html-sanitizer', '~> 1.0'

gem 'bootstrap-sass', '~> 3.2.0'
gem 'font-awesome-sass', '~> 4.2.0'
gem "factory_girl_rails", "~> 4.0"
gem 'hashids'

group :development do
  # Access an IRB console on exceptions page and /console in development
  gem 'web-console', '~> 2.0.0.beta2'
end

group :development, :test do
  # Call 'debugger' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rspec-rails', '~> 3.0.0'
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'shoulda-matchers'
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end
