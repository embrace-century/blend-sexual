require "pry"
require 'active_support'

module BaseConcern
  extend ActiveSupport::Concern
  
  class_methods do
    def setup(database_name, table_name, environment)

      @db ||= YAML.load_file(File.join(File.dirname(__FILE__), "../config", "database.yml"))[environment]
      @db["database"] = database_name
      
      self.establish_connection @db
      self.table_name = table_name  
    end
  end
  
end