# frozen_string_literal: true

class Destroyer < Ship
  def self.ship_template
    Ship.new(
      attack: 4,
      defense: 0,
      hull: 1,
      initiative: 4
    )
  end
end
