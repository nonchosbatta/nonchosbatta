source 'https://rubygems.org'
# ruby '2.1.0', engine: 'rbx', engine_version: '2.5.7'

# Ruby
gem 'racc',   platforms: :rbx
gem 'rubysl', platforms: :rbx

# Rails
gem 'rails', '4.2.1'
gem 'psych',     '~> 2.0', platforms: :rbx
gem 'sprockets', '~> 2.8'
gem 'pg'
gem 'puma'
gem 'bundler-audit'
gem 'goldiloader'
gem 'non-stupid-digest-assets'

# Assets processing
gem 'sass-rails',   '~> 5.0'
gem 'uglifier',     '>= 1.3.0'
gem 'browserify-rails'
gem 'autoprefixer-rails'

# CSS
gem 'susy'
gem 'breakpoint'
gem 'bourbon'
gem 'animate-rails'

# Pagination and stuff
# gem 'kaminari'
# gem 'active_model_serializers'

# Uploaders
# gem 'rmagick', require: false
# gem 'carrierwave'

# Validators
gem 'validate_url'

# Dalli
gem 'connection_pool'
gem 'dalli'

# Features
gem 'devise'
# gem 'pundit'

group :development do
  # gem 'rubocop'
  gem 'letter_opener'
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
  gem 'capistrano-rails-collection'
  # gem 'rack-mini-profiler', require: false
  # gem 'benchmark-ips',      require: false
  gem 'stackprof', platforms: :mri
  gem 'derailed'
end

group :development, :test do
  gem 'spring'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'spork-rails'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'poltergeist'
  gem 'rspec-collection_matchers'
  gem 'simplecov', require: false
end
