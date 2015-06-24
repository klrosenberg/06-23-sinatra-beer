require "active_support"
require "active_support/inflector"

module DatabaseInstanceMethods
  
  # Saves a specific instance to the database.
  #
  # Returns boolean.
  def save  
    table_name = self.class.to_s.pluralize.underscore
    if DATABASE.execute("UPDATE #{table_name} SET name = '#{name}' WHERE id = #{@id};")
      return true
    else
      return false
    end
    
  # Deletes an entry from the database.
  def delete
     table_name = self.class.to_s.pluralize.underscore
     DATABASE.execute("DELETE FROM #{table_name} WHERE id = #{@id};")
  end
end