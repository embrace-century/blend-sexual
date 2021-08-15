require 'active_support/concern'

module Production
  module BaseConcern
    extend ActiveSupport::Concern

    included do
      @db ||= @db ||= YAML.load_file(File.join(File.dirname(__FILE__), '../../config', 'database.yml'))['production']
      establish_connection @db
    end
  end
end
