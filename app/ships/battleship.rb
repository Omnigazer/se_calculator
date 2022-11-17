# frozen_string_literal: true

class Battleship < Ship
  def self.ship_template
    Ship.new(
      attack: 5,
      defense: 2,
      hull: 3,
      initiative: 1
    )
  end
end
