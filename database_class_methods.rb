require "active_support"
require "active_support/inflector"

module DatabaseClassMethods
  
  # Defines table name from Class.
  #
  # Returns string of table name.
  def table_name
    self.to_s.tableize
  end
  
  # Selects all from a specific table.
  #
  # Returns an Array of objects.
  def all
    results = DATABASE.execute("SELECT * FROM #{table_name}")
    store_results = []
    results.each do |hash|
      store_results << self.new(hash)
    end
    return store_results
  end
  
  # Finds a specific row from the table.
  #
  # id - Integer
  #
  # Returns a new instance of the Class.
  def find(id)
    table_name = self.to_s.tableize
    results = DATABASE.execute("SELECT * FROM #{table_name} WHERE id = #{id};").first
    self.new(results)
  end
  
  # Adds a new row to a specified table.
  #
  # options = {} - 
  #
  # Returns a new instance of the Class.
  def add(options = {})
    columns = options.keys
    values = options.values
    columns_for_sql = columns.join(", ")
    individual_values_for_sql = []
    values.each do |value|
      if value.is_a?(String)
        individual_values_for_sql << "'#{value}'"
      else
        individual_values_for_sql << value
      end
    end
    values_for_sql = individual_values_for_sql.join(", ")
    table = self.to_s.pluralize.underscore
    DATABASE.execute("INSERT INTO #{table} (#{columns_for_sql}) VALUES (#{values_for_sql});")
    id = DATABASE.last_insert_row_id
    options["id"] = id
    self.new(options)
  end
  
  # Selects all rows from a specified table that share the same value of a specific column.
  #
  # column - String that identifies column header.
  # id - Integer that identifies a certain value of the column.
  #
  # Returns an Array of objects.
  def where(column_name, id)
     table_name = self.to_s.pluralize.underscore
     column_name = 
     results = DATABASE.execute("SELECT * FROM #{table_name} WHERE #{column_name} = #{id};")
     results_as_objects = []
     results.each do |result_hash|
       results_as_objects << self.new(result_hash)
     end
     return results_as_objects
   end
 end