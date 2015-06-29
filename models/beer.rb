require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Beer
  extend DatabaseClassMethods
  include DatabaseInstanceMethods

  attr_reader :id, :rating
  attr_accessor :name, :abv, :beer_type_id, :brewery_id

  # Instantaites a new instance of the Beer Class.
  # 
  # options = {}- optional argument Hash
  # 
  # Returns new object of the Beer Class.
  def initialize(options = {})
    @id = options['id']
    @name = options['name']
    @abv = options['abv'].to_f
    @beer_type_id = options['beer_type_id'].to_i
    @brewery_id = options['brewery_id'].to_i
    @rating = options['rating'].to_i
  end
  
  # Join beer types and breweries tables to beers table.
  #
  # Returns an Array of Hashes.
  def self.chart
    DATABASE.execute("SELECT beers.name AS beer, beers.abv AS abv, beer_types.name AS style, breweries.name AS brewery FROM beers JOIN beer_types ON beers.beer_type_id = beer_types.id JOIN breweries ON beers.brewery_id = breweries.id ORDER BY beers.name COLLATE NOCASE;")
  end

  # Check to make sure a name is entered for beer type.
  #
  # beer - Hash within params.
  #
  # Returns Boolean.
  def self.empty(name)
    if name.empty?
      true
    else
      false
    end
  end
  
  # Check to see if new Beer has a unique name.
  #
  # name = String
  #
  # Returns Boolean depending if name is included in type_names Array.
  def self.include(name)
    type_names = []
    Beer.all.each do |x|
      type_names << x.name
    end
    type_names.include?("#{name}")
  end
    
  
  # Updates beer type in database.
  #
  # Returns Boolean.
  def save
    if
      DATABASE.execute("UPDATE beers SET name = '#{@name}', abv = #{@abv}, beer_type_id = #{@beer_type_id}, brewery_id = #{@brewery_id} WHERE id = #{id};")
      return true
    else
      return false
    end
  end
end