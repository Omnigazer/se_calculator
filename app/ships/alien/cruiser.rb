# frozen_string_literal: true

module Alien
  class Cruiser < Ship
    def self.ship_template
      Ship.new(
        attack: 5,
        defense: 2,
        hull: 1,
        initiative: 3
      )
    end
  end
end