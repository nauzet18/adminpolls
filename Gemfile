source 'https://rubygems.org'

ruby '2.2.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
#Use postgres
gem 'pg' #Driver BD postgress

#Implementa las acciones REST en los controladores.
gem 'inherited_resources'

#Simple From para la generacion de formularios.
gem 'simple_form'
#Paginacion
gem 'kaminari'
#crear formularios anidados
gem 'cocoon'

#Gema para autentificar
gem 'devise'

# Use Haml
gem 'haml-rails'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use bootstrap
gem 'bootstrap-sass'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Usa no sabria para que es esto exactamente. leer la docuz
#https://github.com/kossnocorp/jquery.turbolinks
gem 'jquery-turbolinks'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  #Depurar con pry
  gem 'pry-rails'
  gem 'pry-byebug'
  #mostrar las cosas bonitas en la consola.
  gem 'awesome_print'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Desde el directorio del proyecto: robocop .
  gem 'rubocop'
end

group :production do
  gem 'rails_12factor' # Para servir los JS y CSS de manera estatica. Heroku lo necesita.
end
