# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4', '>= 6.1.4.6'

group :production, :development, :test do
  # Use postgresql as the database for Active Record
  gem 'pg', '~> 1.1'

  # Use Puma as the app server
  gem 'puma', '~> 5.0'

  # Use SCSS for stylesheets
  gem 'sass-rails', '>= 6'

  # Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
  gem 'webpacker', '~> 5.0'

  # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
  gem 'turbolinks', '~> 5'

  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
  gem 'jbuilder', '~> 2.7'

  # Use Redis adapter to run Action Cable in production
  # gem 'redis', '~> 4.0'
  # Use Active Model has_secure_password
  # gem 'bcrypt', '~> 3.1.7'

  # Use Active Storage variant
  # gem 'image_processing', '~> 1.2'

  # Reduces boot times through caching; required in config/boot.rb
  gem 'bootsnap', '>= 1.4.4', require: false

  # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
  gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

  # Manage DB schame
  gem 'ridgepole', '~> 1.0'

  # devise
  gem 'devise'

  # administrate
  gem 'administrate', '~> 0.17.0'
  gem 'administrate-field-active_storage'
  gem "image_processing"

  gem 'inline_svg'

  gem 'seed-fu', '~> 2.3'

  # read excel file
  gem 'roo', '~> 2.9'
  gem 'roo-xls'

  gem 'paper_trail', '~> 11'

  gem 'whenever'

  gem "amazing_print"
  gem "rails_semantic_logger"

  gem "activerecord-session_store"

  gem "aws-sdk", "~> 3"

  gem 'pundit'

  gem 'kaminari'
  gem 'ransack'

  gem 'parslet'

  gem 'cocoon'

  gem 'prawn'
  gem 'prawn-table'

  gem 'combine_pdf', '~> 1.0'
  gem 'thinreports'

  gem 'wareki'

  gem 'slack-notifier'

  # rqrcode
  gem 'rqrcode'
  gem 'rqrcode_png'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # rspec
  gem 'factory_bot_rails', '~> 6.2'
  gem 'rspec-rails', '~> 5.0'
  gem 'shoulda-matchers', '~> 5.0'

  # lock test
  gem 'fork_break'

  gem 'i18n-tasks', '~> 1.0.11'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'

  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Faker generates reality data at random
  gem 'faker'
end

group :ci do
  # rubocop
  gem 'rubocop-config-prettier'
  gem 'rubocop-github'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
end
