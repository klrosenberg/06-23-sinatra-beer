require "pry"
require "sinatra"
require "sinatra/reloader"

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