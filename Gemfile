source 'https://rubygems.org'

gem 'rails', '4.2.6'

gem 'rails-api'

gem 'mysql2', '0.3.18'

gem 'prmd'

gem 'active_model_serializers', '~> 0.10.0'
# To use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

## test gems
group :development, :test do
  gem 'spring'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'rack-json_schema'
  gem 'guard-rspec'
  gem 'database_cleaner'
  gem 'rspec-request_describer'

  # static code analyzer
  gem 'rubocop', '0.29.1', require: false
  gem 'guard-rubocop', '1.2.0'
end

group :test do
  gem 'faker'
end
