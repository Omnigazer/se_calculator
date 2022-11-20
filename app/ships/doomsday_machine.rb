# frozen_string_literal: true

class DoomsdayMachine < Ship
  def self.ship_template
    Ship.new(
      attack: 9,
      defense: 2,
      hull: 3,
      initiative: 3,
      attacks: 2,
      immune_to_bonus: true
    )
  end
end
