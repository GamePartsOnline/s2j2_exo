require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "| Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |"
puts "| Le but du jeu : être le dernier survivant ! |"
puts "------------------------------------------------"

print "\nTon prénom de guerrier : "
prenom = gets.chomp
user = HumanPlayer.new(prenom)

player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1, player2]

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)

  puts "\n==============================="
  user.show_state

  puts "\nQuelle action veux-tu effectuer ?"
  puts "a - Chercher une meilleure arme"
  puts "s - Chercher à se soigner"
  puts "Attaquer un joueur en vue :"
  enemies.each_with_index do |enemy, i|
    print "#{i} - " ; enemy.show_state if enemy.life_points > 0
  end
  print "> "

  choice = gets.chomp

  case choice
  when "a"
    user.search_weapon
  when "s"
    user.search_health_pack
  else
    index = choice.to_i
    target = enemies[index]
    if target && target.life_points > 0
      user.attacks(target)
    else
      puts "Cible invalide !"
    end
  end

  puts "\nLes ennemis t'attaquent !"
  enemies.each do |enemy|
    enemy.attacks(user) if enemy.life_points > 0
  end

end

puts "\n--- La partie est finie ---"
if user.life_points > 0
  puts "BRAVO ! TU AS GAGNÉ !"
else
  puts "Loser ! Tu as perdu !"
end