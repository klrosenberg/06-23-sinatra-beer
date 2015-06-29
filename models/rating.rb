require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Rating
  extend DatabaseClassMethods
  include DatabaseInstanceMethods

  attr_reader :id, :user_id, :beer_id
  attr_accessor :rating

  # Instantaites a new instance of the Rating Class.
  # 
  # options = {}- optional argument Hash
  # 
  # Returns new object of the Rating Class.
  def initialize(options = {})
    @id = options['id'].to_i
    @user_id = options['user_id'].to_i
    @beer_id = options['beer_id'].to_i
    @rating = options['rating'].to_i
  end
  
  # Check to make sure a number is entered for abv.
  #
  # abv - Integer within params.
  #
  # Returns Boolean.
  def self.empty(rating)
    if rating.empty?
      true
    else
      false
    end
  end
  
  # Find ratings from user id.
  #
  # Return a new instance of the Rating Class.
  def self.find(user_id)
    table_name = self.to_s.tableize
    results = DATABASE.execute("SELECT * FROM #{table_name} WHERE user_id = #{id};").first
    self.new(results)
  end
  
  # Find list of ratings attributed to one user.
  #
  # user_id - integer
  #
  # Returns an Array of Hashes.
  def self.history(user_id)
    DATABASE.execute("SELECT beers.name AS beer, ratings.rating FROM ratings JOIN beers on ratings.beer_id = beers.id WHERE ratings.user_id = #{user_id};")
  end
end
