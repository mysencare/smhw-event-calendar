source 'https://rubygems.org'

ruby File.read(File.join(File.dirname(__FILE__), '.ruby-version')).strip

# Rails 5 with Action Cable
gem 'rails', '~> 5.1.4'

# Simplest DB storage
gem 'sqlite3'

# Slim for templates
gem 'slim', '~> 3.0.8'
gem 'slim-rails', '~> 3.1.0'

# Stylus for styles
gem 'stylus', '~> 1.0.1'

# ES6 for JS
gem 'webpacker', '~> 3.0.2'

# Compress JavaScript in production
gem 'uglifier', '>= 1.3.0'

# Fake values generator
gem 'faker', '~> 1.8.4'

group :development do
  # Run app in background for faster reload
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Run tests in background, too
  gem 'spring-commands-rspec', '~> 1.0.4'

  # Very informative error pages with console
  gem 'better_errors', '~> 2.3.0'

  # Insert console everywhere it's required
  gem 'binding_of_caller', '~> 0.7.2'
  gem 'listen', '~> 3.1.5'
  gem 'web-console', '~> 3.5.1'

  # Debugger for console-only environments
  gem 'byebug', '~> 9.0.6', platform: :mri
end

group :development, :test do
  # Eloquent specs
  gem 'rspec-rails', '~> 3.6.1'

  # Testing helpers
  gem 'shoulda-matchers', '~> 3.1.2'

  # Cleaner test names
  gem 'should_not', '~> 1.1.0'

  # Acceptance testing
  gem 'capybara', '~> 2.15.1'

  # Screenshot all failures
  gem 'capybara-screenshot', '~> 1.0.17'

  # Test with real Chrome
  gem 'chromedriver-helper', '~> 1.1.0'
  gem 'selenium-webdriver', '~> 3.4.4'
end

group :test do
  # Instafailing formatter
  gem 'fuubar', '~> 2.2.0'

  # Generate code coverage reports
  gem 'simplecov', '~> 0.15.1'
end
