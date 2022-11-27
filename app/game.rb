# frozen_string_literal: true

class Game
  include ActiveModel::Model
  attr_accessor :fleet1, :fleet2

  def simulate(options = {})    
    with_terrain(options) do
      while fleet1.ships.any? && fleet2.ships.any?
        fleet1.determine_bonus(fleet2)
        fleet2.determine_bonus(fleet1)
        
        a, b = [fleet2, fleet1].sort_by(&:tactics).reverse      
  
        (1..5).each do |initiative|
          a.take_ships(initiative).each do |ship|
            ship.attacks.times do
              ship.fire(a.target(b))
            end          
          end
  
          b.take_ships(initiative).each do |ship|
            ship.attacks.times do
              ship.fire(b.target(a))
            end          
          end
        end
      end
    end
    
    { victory: fleet1.ships.any?, survivors: fleet1.ships.count }
  end

  def with_terrain(options)
    fleet1.nebula = options[:nebula]
    fleet2.nebula = options[:nebula]

    fleet1.asteroids = options[:asteroids]
    fleet2.asteroids = options[:asteroids]

    yield

    fleet1.nebula = false
    fleet2.nebula = false

    fleet1.asteroids = false
    fleet2.asteroids = false
  end
end
