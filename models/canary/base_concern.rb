require 'active_support/concern'

module Canary
  module BaseConcern
    extend ActiveSupport::Concern

    included do
      @db ||= YAML.load_file(File.join(File.dirname(__FILE__), '../../config', 'database.yml'))['canary']
      establish_connection @db
    end
  end
end
