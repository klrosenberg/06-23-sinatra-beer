# Create database for this program.
DATABASE = SQLite3::Database.new("beerarchive.db")

# Make the tables
DATABASE.execute("CREATE TABLE IF NOT EXISTS beers (id INTEGER PRIMARY KEY, name TEXT UNIQUE, abv INTEGER, beer_type_id INTEGER, brewery_id INTEGER, avg_rating INTEGER);")
DATABASE.execute("CREATE TABLE IF NOT EXISTS breweries (id INTEGER PRIMARY KEY, name TEXT UNIQUE);")
DATABASE.execute("CREATE TABLE IF NOT EXISTS beer_types (id INTEGER PRIMARY KEY, name TEXT UNIQUE);")
DATABASE.execute("CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name TEXT UNIQUE);")
DATABASE.execute("CREATE TABLE IF NOT EXISTS ratings (id INTEGER PRIMARY KEY, user_id INTEGER, beer_id INTEGER, rating INTEGER);")

# Return results as an Array of Hashes.
DATABASE.results_as_hash = true