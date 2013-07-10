source 'https://rubygems.org'

# Server requirements
gem 'thin'

# Project requirements
gem 'foreman'
gem 'rake'

# Component requirements
gem 'sass'
gem 'haml'
gem 'dm-validations'
gem 'dm-timestamps'
gem 'dm-migrations'
gem 'dm-constraints'
gem 'dm-aggregates'
gem 'dm-types'
gem 'dm-core'
gem 'dm-adjust'

# Production requirements
group :production do
  gem 'dm-postgres-adapter'
  gem 'pg', :group => 'production'
end

# Development requirements
group :development do
  gem 'dm-sqlite-adapter'
end

group :test do
  gem 'rspec'
  gem 'rack-test', :require => 'rack/test'
end

# Padrino Stable Gem
gem 'padrino', '0.11.2'
