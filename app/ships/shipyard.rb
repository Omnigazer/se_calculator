# frozen_string_literal: true

class Shipyard < Ship
  def self.ship_template
    Ship.new(
      attack: 3,
      defense: 0,
      hull: 1,
      initiative: 3
    )
  end
end
