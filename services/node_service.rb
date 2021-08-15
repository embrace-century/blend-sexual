require 'pry'

class NodeService
  def self.migrate_to_production_at(zoom)
    canaries = Canary::Node.where(zoom: zoom).count
  end
end
