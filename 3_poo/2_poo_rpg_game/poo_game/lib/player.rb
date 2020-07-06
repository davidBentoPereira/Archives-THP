class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie."
  end

  def gets_damage(damage)
    @life_points -= damage
  end

  def attacks(attacked_player)
    print "Le joueur #{@name} attaque le joueur #{attacked_player.name} ! "
    damage = compute_damage
    attacked_player.gets_damage(damage)
    if attacked_player.life_points > 0
      print  "Il lui inflige #{damage} points de dommages !\n"
    else
      puts "Le joueur #{attacked_player.name} a été tué !"
    end
  end

  def compute_damage
    rand(1..6)
  end
end

