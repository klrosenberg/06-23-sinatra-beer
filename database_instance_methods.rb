require "active_support"
require "active_support/inflector"

module DatabaseInstanceMethods
  
  # Determines table from instance of a Class.
  #
  # Returns a String of the name of the table.
  def table
    self.class.to_s.pluralize.underscore
  end
  
  # Saves a specific instance to the database.
  #
  # Returns boolean.
  def save  
    return true if DATABASE.execute("UPDATE #{table} SET name = '#{name}' WHERE id = #{@id};")
  end
    
  # Deletes an entry from the database.
  def delete
     DATABASE.execute("DELETE FROM #{table} WHERE id = #{@id};")
  end
end