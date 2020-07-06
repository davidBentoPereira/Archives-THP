class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{name} possède #{life_points} pv et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    puts "#{@name} se lance en quête d'une nouvelle arme..."
    new_weapon_lvl = rand(1..6)
    if @weapon_level < new_weapon_lvl
      @weapon_level = new_weapon_lvl
      puts "[arme actuelle: lvl#{weapon_level}] Tu as trouvé une nouvelle arme de lvl #{new_weapon_lvl} ! C'est bon
ça !"
    else
      puts "[arme actuelle: lvl#{weapon_level}] Tu as trouvé une nouvelle arme de lvl #{new_weapon_lvl} plus faible que la tienne. LOOOOOSEEEEER !!!"
    end
  end

  def search_health_pack
    health_pack = rand(1..6)
    if health_pack === 1
      puts "[PV: #{life_points}] Tu rentres bredouille mon jacqouille !"
    elsif health_pack >= 2 && health_pack <= 5
      new_life_points = @life_points + 50
      if new_life_points < 100
        @life_points  = new_life_points
      else
        @life_points = 100
      end
      puts "[PV: #{life_points}] Bravo, tu as trouvé un pack de +50 pv !"
    else
      new_life_points = @life_points + 80
      if new_life_points < 100
        @life_points  = new_life_points
      else
        @life_points = 100
      end
      puts "[PV: #{life_points}] Bravo, tu as trouvé un pack de +80 pv !"
    end

  end
end