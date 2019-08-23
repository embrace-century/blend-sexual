require 'active_record'
require 'yaml'
require_relative 'base_concern.rb'

class SourceTable < ActiveRecord::Base
  
  include BaseConcern
  
  def self.run
    @total_count = SourceTable.count
    @current_count = 0

    SourceTable.find_each do |source|

      @current_count = @current_count + 1

      target = source.load_target
      if target.attributes.reject { |k, v| "id" == k } != source.attributes.reject { |k, v| "id" == k }
        puts source.id
      end

      i = ((@current_count * 100 ) / @total_count).to_i

      printf "\r%s", "[" + "#" * i + "\s" * (100 - i) + "]" + "(#{i}/100)"
      $stdout.flush
    end
  end
  
  def load_target
    target = TargetTable.find_by(code: self.code, datatime: self.datatime)
  end
end
