# frozen_string_literal: true

module Alien
  class Destroyer < Ship
    def self.ship_template
      Ship.new(
        attack: 4,
        defense: 1,
        hull: 1,
        initiative: 4
      )
    end
  end
end