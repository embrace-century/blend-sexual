require 'active_record'
require 'yaml'

class SourceTable < ActiveRecord::Base
  @db ||= YAML.load_file(File.join("config", "database.yml"))["source"]
  ActiveRecord::Base.establish_connection @db
  self.table_name = "t_src_cqi_region_month"
  
  
  def self.run

    SourceTable.find_each do |source|

      puts "当前正在处理的 Source ID 是： #{source.id}"

      target = source.load_target

      if target.attributes.reject { |k, v| "id" == k } != source.attributes.reject { |k, v| "id" == k }
        puts source.id
      end
    end
  end
  
  def load_target
    target = TargetTable.find_by(
      code:     self.code,
      datatime: self.datatime
    )

    return target
  end
end