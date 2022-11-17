# frozen_string_literal: true

class Battlecruiser < Ship
  def self.ship_template
    Ship.new(
      attack: 5,
      defense: 1,
      hull: 2,
      initiative: 5
    )
  end
end
