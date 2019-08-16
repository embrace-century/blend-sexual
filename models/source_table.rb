require 'active_record'
require 'yaml'

class SourceTable < ActiveRecord::Base
  @db ||= YAML.load_file(File.join("config", "database.yml"))["source"]
  ActiveRecord::Base.establish_connection @db
  self.table_name = "t_src_cqi_region_month"
end