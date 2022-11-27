# frozen_string_literal: true

class Ship
  include ActiveModel::Model
  attr_accessor :attack, :defense, :hull, :initiative, :fleet, :damage, 
                :attacks, :immune_to_bonus

  def initialize(attributes = {})
    @damage = 0
    @attacks = 1
    @immune_to_bonus = false
    super(attributes)
  end

  def self.create(n = 1)
    Array.new(n) do
      ship_template
    end
  end

  def self.*(n)
    create(n)
  end

  def take_hit
    self.damage += 1
    destroy if damage >= hull
  end

  def fire(ship)
    return if ship.nil? || ship.destroyed?

    result = roll
    check = attack - ship.defense
    check += 1 if fleet.bonus && !ship.immune_to_bonus
    ship.take_hit if result <= check || result == 1
  end

  def attack
    @attack + attack_upgrade
  end

  def defense
    @defense + defense_upgrade
  end

  def attack_upgrade
    return 0 if fleet.asteroids

    [fleet.attack, hull].min
  end

  def defense_upgrade
    return 0 if fleet.nebula

    [fleet.defense, hull].min
  end

  def initiative
    return 5 if fleet.asteroids || fleet.nebula

    @initiative
  end

  def destroy
    fleet.ships.delete(self)
    self.fleet = nil
  end

  def destroyed?
    fleet.nil?
  end

  private

  def roll
    rand(1..10)
  end
end
