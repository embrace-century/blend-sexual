class LotService
  def self.migrate_to_production
    index = 0
    canaries = Canary::Lot.all
    canaries.each do |canary|
      Production::Lot.create!(
        name: canary.name,
        area: canary.area,
        lotuse: canary.lotuse,
        shunt: canary.shunt,
        category: canary.category,
        shunting_status: canary.shunting_status,
        shunting_level: canary.shunting_level,
        district: canary.district,
        hidden: canary.hidden,
      )
      puts index
      index += 1
    end
  end
end