# frozen_string_literal: true

module Alien
  class Battlecruiser < Ship
    def self.ship_template
      Ship.new(
        attack: 6,
        defense: 2,
        hull: 1,
        initiative: 2
      )
    end
  end
end