require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

while player1.life_points > 0 && player2.life_points > 0

  puts "\nVoici l'état de nos joueurs :"
  player1.show_state
  player2.show_state

  puts "\nPassons à la phase d'attaque :"
  player1.attacks(player2)

  break if player2.life_points <= 0

  player2.attacks(player1)

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

end

puts "\n--- FIN DU COMBAT ---"