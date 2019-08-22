require 'active_record'
require 'yaml'
require_relative 'base_concern.rb'

class SourceTable < ActiveRecord::Base
  
  include BaseConcern
  
  def self.run
    SourceTable.find_each do |source|
      target = source.load_target
      if target.attributes.reject { |k, v| "id" == k } != source.attributes.reject { |k, v| "id" == k }
        puts source.id
      end
    end
  end
  
  def load_target
    target = TargetTable.find_by(code: self.code, datatime: self.datatime)
  end
end