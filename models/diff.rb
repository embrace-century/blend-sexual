require 'pry'

module Diff
  
  def self.diff
    puts "diff"
  end
  
  # 需要动态指定数据库的名字 和 表的名字
  def self.run(args)
    target_config = args[0].split('.')
    source_config = args[1].split('.')

    TargetTable.setup(target_config[0], target_config[1])
    SourceTable.setup(source_config[0], source_config[1])

    SourceTable.run
  end
end

# ruby main.rb target_database.t_src_cqi_region_month source_database.t_src_cqi_region_month