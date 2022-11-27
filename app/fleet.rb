# frozen_string_literal: true

class Fleet
  include ActiveModel::Model

  attr_accessor :ships, :attack, :defense, :fighters, :tactics, :bonus, :strat
  attr_accessor :nebula, :asteroids

  def initialize(attributes = {})
    @ships = []
    @attack ||= 0
    @defense ||= 0
    @fighters = 0
    @tactics ||= 0
    @nebula = false
    @asteroids = false
    @strat ||= FirstShip
    super(attributes)
  end

  def add_ships(*new_ships)
    new_ships = Array.wrap(new_ships).flatten
    new_ships.map! do |ship|
      ship = ship.create if ship.is_a?(Class) && (ship < Ship || ship == Ship)
      ship
    end
    new_ships = Array.wrap(new_ships).flatten

    new_ships.each do |ship|
      @ships << ship
      ship.fleet = self
    end
  end

  def target(other_fleet)
    strat.target(other_fleet)
  end

  def take_ships(initiative)
    ships.select { |ship| ship.initiative == initiative }
  end

  def determine_bonus(other_fleet)
    @bonus = (ships.count / other_fleet.ships.count) >= 2
  end
end
