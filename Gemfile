source 'https://rubygems.org'
ruby "2.2.2"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Bootstrap sass gem added for design 
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.5.1'

# Added paperclip for image uploads
# requires imagemagick to be installed - complete via brew install
gem 'paperclip', '~> 4.3', '>= 4.3.1'
# Storage solution for paperclip using Dropbox. Heroku only temporarly stores images. 
gem 'paperclip-dropbox', '>= 1.1.7'
# Added to protect Dropbox YML file from Github
gem 'figaro', '~> 1.1', '>= 1.1.1'
# Devise added for User Authentication
gem 'devise', '~> 3.5', '>= 3.5.2'
# Stripe added to use API for payments
gem 'stripe'
# Adding Pagination to site - Goal to add infinite scroll through each item in a category
gem 'will_paginate', '~> 3.0', '>= 3.0.7'
# Added to add bootstrap style to Paginate
gem 'will_paginate-bootstrap', '~> 1.0', '>= 1.0.1'
# Added searchkick for extra search functionality
# requires elasticsearch to be installed after Java installed
# after set up localhost:9200 will confirm installed on computer
gem 'searchkick', '~> 0.9.1'

# Generate an entity-relationship diagram for application
gem 'rails-erd', '~> 1.4', '>= 1.4.4'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production do
	gem 'pg'
	gem 'rails_12factor'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # Use sqlite3 as the database for Active Record
	gem 'sqlite3'
  gem 'byebug'

  # Gems created by me
  gem 'profanity_checker'
  gem 'report_logger'

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

