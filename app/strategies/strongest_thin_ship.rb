# frozen_string_literal: true

class StrongestThinShip
  def self.target(fleet)
    min_hull = fleet.ships.map(&:hull).min
    selection = fleet.ships.select { |ship| ship.hull == min_hull }
    selection.max_by(&:attack)
  end
end
