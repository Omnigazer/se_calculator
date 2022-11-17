# frozen_string_literal: true

class Game
  include ActiveModel::Model
  attr_accessor :fleet1, :fleet2

  def simulate
    while fleet1.ships.any? && fleet2.ships.any?
      fleet1.determine_bonus(fleet2)
      fleet2.determine_bonus(fleet1)
      
      a, b = [fleet2, fleet1].sort_by(&:tactics).reverse      

      (1..5).each do |initiative|
        a.take_ships(initiative).each do |ship|
          ship.fire(a.target(b))
        end

        b.take_ships(initiative).each do |ship|
          ship.fire(b.target(a))
        end
      end
    end
    { victory: fleet1.ships.any?, survivors: fleet1.ships.count }
  end
end
