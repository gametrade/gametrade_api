source 'https://rubygems.org'

gem 'rails',                        '~> 5.0.5'
gem 'puma',                         '~> 3.0'
gem 'jbuilder',                     '~> 2.5'
gem 'ransack',                      '~> 1.8.3'
gem 'sqlite3'
gem 'rack-cors'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry-byebug'
  gem 'dotenv-rails'
end

group :development do
  gem 'rubocop'
  gem 'rails_best_practices'
  gem 'listen',                     '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen',      '~> 2.0.0'
end

group :test do
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
end