require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Brewery
  extend DatabaseClassMethods
  include DatabaseInstanceMethods

  attr_reader :id
  attr_accessor :name

  # Instantaites a new instance of the Brewery Class.
  # 
  # options = {}- optional argument Hash
  # 
  # Returns new object of the Brewery Class.
  def initialize(options = {})
    @id = options['id']
    @name = options['name']
  end
  
  # Check to make sure a name is entered for brewery.
  #
  # Returns Boolean.
  def self.empty(name)
    return true if name.empty?
  end
  
  # Check to see if new Brewery has a unique name.
  #
  # name = String
  #
  # Returns Boolean depending if name is included in type_names Array.
  def self.include(name)
    type_names = []
    Brewery.all.each do |x|
      type_names << x.name
    end
    type_names.include?("#{name}")
  end
    
  
  # # Updates beer type in database.
  # #
  # # Returns Boolean.
  # def save
  #   return true if DATABASE.execute("UPDATE breweries SET name = '#{@name}' WHERE id = #{id};")
  #   end
  # end
end