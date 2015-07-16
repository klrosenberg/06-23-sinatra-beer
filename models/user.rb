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
    @email = options['email']
    @name = options['name']
    @password = options['password']
  end
  
  # Check to make sure a name is entered for user.
  #
  # Returns Boolean.
  def self.empty(name)
    return true if name.empty?
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
  
  # Find user by email
  #
  # email - String of user email
  #
  # Return user object.
  def self.find_by_email(email)
    results = DATABASE.execute("SELECT * FROM users WHERE email = '#{email}';")
    self.new(results)
  end
    
  
  # # Updates user in database.
  # #
  # # Returns Boolean.
  # def save
  #   return true if DATABASE.execute("UPDATE users SET name = '#{@name}' WHERE id = #{id};")
  #   end
  # end
end