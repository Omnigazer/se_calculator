# frozen_string_literal: true

require 'bundler/setup'
Bundler.require(:default)
require 'active_model'
require 'active_support/all'
%w[app].each { |dir| require_all(dir) }

def generate_fleets
  fleet1 = Fleet.new(defense: 1, strat: StrongestThinShip)
  fleet1.add_ships(Cruiser * 4)

  fleet2 = Fleet.new
  fleet2.add_ships(
    Cruiser * 3,
    Battlecruiser
  )
  {
    fleet1: fleet1,
    fleet2: fleet2
  }
end

victories = 0
survivors = 0
N = 20_000
N.times do
  res = Game.new(generate_fleets).simulate
  victories += 1 if res[:victory]
  survivors += res[:survivors]
end
p 100 * (victories.to_f / N)
p survivors.to_f / N
