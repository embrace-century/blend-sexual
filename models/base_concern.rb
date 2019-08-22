require "pry"
require 'active_support'

module BaseConcern
  extend ActiveSupport::Concern
  
  class_methods do
    def setup(database_name, table_name)
      @db ||= YAML.load_file(File.join("config", "database.yml"))["source"]
      @db["database"] = database_name
      
      ActiveRecord::Base.establish_connection @db
      self.table_name = table_name  
    end
  end
  
end