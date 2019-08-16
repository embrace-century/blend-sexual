require 'active_record'
require 'yaml'

class BaseRecord < ActiveRecord::Base

  # ActiveSupport::LogSubscriber.colorize_logging = false

  # self.abstract_class = true
  # self.logger = Logger.new(File.dirname(__FILE__) + "/../log/models.log", 'daily')
end
