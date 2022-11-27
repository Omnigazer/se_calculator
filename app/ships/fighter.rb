# frozen_string_literal: true

class Fighter < Ship
  def self.ship_template
    Ship.new(
      attack: 5,
      defense: 0,
      hull: 1,
      initiative: 2
    )
  end

  def attack
    super + ([0, 1, 2][fighter_upgrade] || 0)
  end

  def defense
    super + ([0, 0, 1][fighter_upgrade] || 0)
  end

  def fighter_upgrade
    fleet.fighters
  end
end
