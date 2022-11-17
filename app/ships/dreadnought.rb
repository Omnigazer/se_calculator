# frozen_string_literal: true

class Dreadnought < Ship
  def self.ship_template
    Ship.new(
      attack: 6,
      defense: 3,
      hull: 3,
      initiative: 1
    )
  end
end
