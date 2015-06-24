require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class BeerType
  extend DatabaseClassMethods
  include DatabaseInstanceMethods

  attr_reader :id
  attr_accessor :name

  def initialize(options = {})
    @id = options['id']
    @name = options['name']
  end

  def save
    if
      DATABASE.execute("UPDATE beer_types SET name = '#{@name}' WHERE id = #{id};")
      return true
    else
      return false
    end
  end
end