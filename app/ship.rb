# frozen_string_literal: true

class Ship
  include ActiveModel::Model
  attr_accessor :attack, :defense, :hull, :initiative, :fleet, :damage

  def initialize(attributes = {})
    @damage = 0
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
    ship.take_hit if result <= attack - ship.defense || result == 1
  end

  def attack
    @attack + fleet.attack + (fleet.bonus ? 1 : 0)
  end

  def defense
    @defense + fleet.defense
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
