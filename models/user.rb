require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class User
  extend DatabaseClassMethods
  include DatabaseInstanceMethods

  attr_reader :id
  attr_accessor :name

  # Instantaites a new instance of the User Class.
  # 
  # options = {}- optional argument Hash
  # 
  # Returns new object of the Brewery Class.
  def initialize(options = {})
    @id = options['id']
    @name = options['name']
  end
  
  # Check to make sure a name is entered for user.
  #
  # Returns Boolean.
  def self.empty(name)
    if name.empty?
      true
    else
      false
    end
  end
  
  # Check to see if new user has a unique name.
  #
  # name = String
  #
  # Returns Boolean depending if name is included in type_names Array.
  def self.include(name)
    type_names = []
    User.all.each do |x|
      type_names << x.name
    end
    type_names.include?("#{name}")
  end
    
  
  # Updates user in database.
  #
  # Returns Boolean.
  def save
    if
      DATABASE.execute("UPDATE users SET name = '#{@name}' WHERE id = #{id};")
      return true
    else
      return false
    end
  end
end