require 'active_record'
require 'yaml'
require_relative 'production/base_concern.rb'

class TargetTable < ActiveRecord::Base
  include BaseConcern
end