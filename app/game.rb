# frozen_string_literal: true

class Game
  include ActiveModel::Model
  attr_accessor :fleet1, :fleet2

  def simulate
    while fleet1.ships.any? && fleet2.ships.any?
      fleet1.determine_bonus(fleet2)
      fleet2.determine_bonus(fleet1)

      (1..5).each do |initiative|
        fleet2.take_ships(initiative).each do |ship|
          ship.fire(fleet2.target(fleet1))
        end

        fleet1.take_ships(initiative).each do |ship|
          ship.fire(fleet1.target(fleet2))
        end
      end
    end
    { victory: fleet1.ships.any?, survivors: fleet1.ships.count }
  end
end
