source 'https://rubygems.org'
ruby "2.6.4"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails'
gem 'bcrypt',                  '3.1.11'
gem 'faker',                   '1.7.3'
gem 'carrierwave',             '1.2.2'
gem 'mini_magick',             '>= 4.9.4'
gem 'hirb'
gem 'will_paginate',           '3.1.6'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'bootstrap-sass',  '>= 3.4.1'
# gem 'turbo-sprockets-rails5'

gem 'puma',                   '3.9.1'
gem 'sass-rails',             '5.0.6'
gem 'uglifier',               '3.2.0'
# gem 'therubyracer', platforms: :ruby

gem 'coffee-rails',           '4.2.2'
# I added this gem
gem 'jquery-rails',           '4.3.1'

gem 'turbolinks',             '5.0.1'
gem 'jquery-turbolinks'
gem 'jbuilder',               '2.7.0'
# gem 'redis', '~> 3.0'
gem 'omniauth-twitter'
gem "actionview", ">= 5.1.6.2"
gem "activejob", ">= 5.1.6.1"

# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'sqlite3',   '1.3.13'

  gem 'byebug',    '9.0.6', platform: :mri
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console',           '3.5.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
end

group :production do
  gem 'pg', '0.20.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
