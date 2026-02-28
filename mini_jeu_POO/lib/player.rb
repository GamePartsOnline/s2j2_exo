class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage_received)
    @life_points = @life_points - damage_received
    if @life_points <= 0
      puts "le joueur #{@name} a été tué !"
    end
  end

  def compute_damage
    rand(1..6)
  end

  def attacks(other_player)
    puts "#{@name} attaque #{other_player.name}"
    damage = compute_damage
    puts "il lui inflige #{damage} points de dommages"
    other_player.gets_damage(damage)
  end

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

  def search_weapon
    found = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{found}"
    if found > @weapon_level
      @weapon_level = found
      puts "Youhou ! Elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... Elle n'est pas mieux que ton arme actuelle."
    end
  end
  
  def search_health_pack
    result = rand(1..6)
    if result == 1
      puts "Tu n'as rien trouvé..."
    elsif result.between?(2, 5)
      @life_points = [@life_points + 50, 100].min
      puts "Bravo ! Tu as trouvé un pack de +50 points de vie !"
    else
      @life_points = [@life_points + 80, 100].min
      puts "Waow ! Tu as trouvé un pack de +80 points de vie !"
    end
  end

end