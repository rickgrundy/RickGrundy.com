source 'http://rubygems.org'

ruby '2.2.4'

gem 'thin'
gem 'rails', '~> 3.2'
gem 'haml', '~> 4.0'
gem 'devise'
gem 'acts_as_list'
gem 'paperclip'
gem 'aws-sdk', '~> 2.10'
gem 'pony'
gem 'newrelic_rpm', '~> 3.5'

gem 'test-unit', '~> 3.0'  # Required by heroku console for some reason

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg', '~> 0.11'
end
