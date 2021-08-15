require 'active_record'
require_relative 'base_concern'

module Production
  class Base < ActiveRecord::Base
    include BaseConcern
    ActiveSupport::LogSubscriber.colorize_logging = true
    self.abstract_class = true
  end
end
