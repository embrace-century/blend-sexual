require 'active_record'
require 'yaml'
require_relative 'base_concern.rb'

class SourceTable < ActiveRecord::Base
  
  include BaseConcern
  
  def self.run
    @total_count = SourceTable.count
    @current_count = 0
    @ansMap = {}
    @ansAry = []

    SourceTable.find_each do |source|
      @current_count = @current_count + 1

      target = source.load_target
      next if target == nil

      target.attributes.reject { |k, v| "id" == k }.keys.each do |key|
        @cur = "#{target.code}-#{target.datatime}"
      
        if target.send(key) != source.send(key)
          @cur = "#{@cur} #{key} (#{source.send(key)} #{target.send(key)}) "
        end

        @ansAry << @cur if ("#{target.code}-#{target.datatime}" != @cur)
      end

      i = ((@current_count * 100 ) / @total_count).to_i

      printf "\r%s", "[" + "#" * i + "\s" * (100 - i) + "]" + "(#{i}/100)"
      $stdout.flush
    end
    @ansAry = @ansAry.select { |obj| obj.length >= 32 }

    puts @ansAry
  end
  
  def load_target
    target = TargetTable.find_by(code: self.code, datatime: self.datatime)
  end
end