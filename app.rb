require 'rubygems'
require 'bundler/setup'

require "pry"
require "sinatra"
require "sinatra/reloader"
require "bcrypt"
require "active_support"
require "active_support/inflector"
require "active_record"

configure :development do
  ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'beerarchive.db')
end

configure :production do  
  db = URI.parse(ENV['DATABASE_URL'])

  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end

set :sessions, true

# SQL/Database
require "sqlite3"
require_relative "database_setup.rb"

# Models
require_relative "models/beer_type.rb"
require_relative "models/brewery.rb"
require_relative "models/user.rb"
require_relative "models/beer.rb"
require_relative "models/rating.rb"


# Controllers
require_relative "controllers/main.rb"
require_relative "controllers/beer_types.rb"
require_relative "controllers/breweries.rb"
require_relative "controllers/users.rb"
require_relative "controllers/beers.rb"
require_relative "controllers/ratings.rb"