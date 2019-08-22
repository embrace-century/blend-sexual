require 'active_record'
require 'yaml'
require_relative 'base_concern.rb'

class TargetTable < ActiveRecord::Base
  include BaseConcern
end