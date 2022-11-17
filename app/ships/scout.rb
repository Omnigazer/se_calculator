# frozen_string_literal: true

class Scout < Ship
  def self.ship_template
    Ship.new(
      attack: 3,
      defense: 0,
      hull: 1,
      initiative: 5
    )
  end
end
