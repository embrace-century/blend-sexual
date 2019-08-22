require 'active_record'
require 'yaml'

class TargetTable < ActiveRecord::Base
  include BaseConcern
end