class Game
  attr_accessor :human_player, :enemies_in_sight, :players_left

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @enemies_in_sight = []
    @players_left = 10
  end

  def is_still_ongoing?
    @human_player.life_points > 0 && @players_left > 0
  end

  def kill_player(player)
    @enemies_in_sight.delete(player)
    @players_left -= 1
  end

  def show_players
    @human_player.show_state
    puts "Ennemis restants : #{@players_left} (#{@enemies_in_sight.length} en vue)"
  end

  def menu
    puts "\nQuelle action veux-tu effectuer ?"
    puts "a - Chercher une meilleure arme"
    puts "s - Chercher à se soigner"
    puts "Attaquer un ennemi en vue :"
    @enemies_in_sight.each_with_index do |enemy, i|
      puts "#{i} - #{enemy.name} a #{enemy.life_points} points de vie" if enemy.life_points > 0
    end
    print "> "
  end
  
  def menu_choice(choice)
    case choice
    when "a"
      @human_player.search_weapon
    when "s"
      @human_player.search_health_pack
    else
      index = choice.to_i
      target = @enemies_in_sight[index]
      if target && target.life_points > 0
        @human_player.attacks(target)
        kill_player(target) if target.life_points <= 0
      else
        puts "Cible invalide !"
      end
    end
  end
  
  def enemies_attack
    puts "\nLes ennemis t'attaquent !"
    @enemies_in_sight.each do |enemy|
      enemy.attacks(@human_player) if enemy.life_points > 0
    end
  end
  
  def new_players_in_sight
    if @enemies_in_sight.length >= @players_left
      puts "Tous les ennemis sont déjà en vue."
      return
    end
    roll = rand(1..6)
    if roll == 1
      puts "Calme plat... Aucun nouvel ennemi."
    elsif roll.between?(2, 4)
      add_enemy(1)
    else
      add_enemy(2)
    end
  end
  
  def end_game
    puts "\n--- LA PARTIE EST TERMINÉE ---"
    if @human_player.life_points > 0
      puts "BRAVO ! TU AS GAGNÉ !"
    else
      puts "Loser ! Tu as perdu !"
    end
  end
  
  private
  
  def add_enemy(count)
    count.times do
      name = "Joueur_#{rand(1000..9999)}"
      @enemies_in_sight << Player.new(name)
      puts "⚠️  #{name} est apparu !"
    end
  end

end