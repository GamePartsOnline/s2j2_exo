require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "================================================"
puts "| 🎮 ILS VEULENT TOUS MA POO - v3.0           |"
puts "| Survie face à 10 ennemis qui arrivent...    |"
puts "================================================"

print "\nTon nom de guerrier : "
nom = gets.chomp

my_game = Game.new(nom)

while my_game.is_still_ongoing?
  puts "\n" + "=" * 40
  my_game.show_players
  my_game.new_players_in_sight
  my_game.menu
  choice = gets.chomp
  my_game.menu_choice(choice)
  my_game.enemies_attack if my_game.is_still_ongoing?
end

my_game.end_game