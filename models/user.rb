require_relative "database_class_methods.rb"
require_relative "database_instance_methods.rb"

class Users
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_reader :id
  attr_accessor :name
  
  def initialize(options = {})
    @id = options['id']
    @name = options['name']
  end