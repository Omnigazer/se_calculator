# frozen_string_literal: true

class Cruiser < Ship
  def self.ship_template
    Ship.new(
      attack: 4,
      defense: 1,
      hull: 2,
      initiative: 5
    )
  end
end
