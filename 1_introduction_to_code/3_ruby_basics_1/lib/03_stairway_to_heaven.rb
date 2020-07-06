class Jumanjii
  attr_accessor :position
  attr_accessor :throw_number
  attr_accessor :game_mode # manual = 0 automatic = 1

  def initialize
    @position = 0
    @throw_number = 0
    @game_mode = 0
    @game_stats = []
  end

  # Method asking player whether he wants to play or to quit the game
  def ask_player_game_mode
    puts "Tapez '1' pour jouer au jumanji en mode manuel"
    puts "Tapez '2' si vous êtes une grosse feignasse du genre incapable de traverser la rue pour trouver du taf et que vous voulez jouer en mode automatique"
    puts "Tapez '3' pour lancer 100 partie en mode automatique et obtenir le nombre moyen de tours pour gagner le Jumanji"
    print "> "
    choice = gets.to_i

    if choice === 1
      @game_mode = 0
      manual_game
    elsif choice === 2
      @game_mode = 1
      automatic_game
    elsif choice === 3
      @game_mode = 1
      average_finish_time
    else
      exit
    end
  end

  def manual_game
    puts "- - - - - Jeu en mode manuel - - - - - - - - -"
    puts "Tapez '1' pour lancer le dé numéroté de 1 à 6"
    puts "Tapez sur n'importe quelle touche pour rage quit le jeu ** et passer pour une petite lopette**"
    print "> "
    choose = gets.to_i

    if choose === 1
      throw_dice
    else
      "Fin de la partie de Jumanji. Voilà ta position : #{position}"
      exit
    end
  end

  def automatic_game
    while @position != 10
      throw_dice
    end
  end

  def average_finish_time
    @game_mode = 1

    100.times do |i|
      automatic_game
      @game_stats[i] = @throw_number
    end
    total_number_of_tours = 0

    @game_stats.each do |game_stat|
      total_number_of_tours = total_number_of_tours + game_stat
    end

    average_finish_tours = total_number_of_tours / @game_stats.length

    puts "Le nombre de tours moyen pour arriver à la 10ème marche est #{average_finish_tours}"
  end

  # Method to throw the dice
  def throw_dice
    @throw_number = @throw_number + 1
    dice = rand(6)

    # Execute an action depending the dice' result
    if dice === 1
      if @position > 1 && @position < 10
        @position = @position - 1
      end
      puts "T'es MAUVAIIIIS JAAACK. Tu te prends un coup de savatte dans le fion et tu descend d'une case. Sheeeeh. [Le joueur se trouve désormais en position #{position}]"
    elsif dice >= 2 && dice <= 4
      puts "Dans la nuit noir il s'passe plus rien, du moins il me semble (cf. Les aventures de Gérard Lambert, Renaud). [Le joueur se trouve désormais en position #{position}]"
    elsif dice >= 5 && dice <= 6
      @position = @position + 1
      puts "Le joueur avance d'une marche. [Le joueur se trouve désormais en position #{position}]"
    end

    if position === 10
      puts "Et bah c'est pas trop tôt ! T'as enfin gagné la partie de Jumanji en #{throw_number} tours"
      puts "Par contre :"
      puts "- Ta petite soeur s'est faite dévoré par les loups"
      puts "- Un virus chinois à ravagé la moitié de la population mondiale"
      puts "- Des scientifiques ont ressuscités les dinosaurs à partir de fossils et ils sont désormais les princiaux prédateurs des hommes"
    else
      if game_mode === 0
        manual_game
      elsif game_mode === 1
        automatic_game
      end
    end
  end
end

# Method to perform the program
def perform
  puts "Bienvenu dans Jumanji, que voulez-vous faire ? "
  puts "- - - - - - - - - - - - - - - - - - - - - - - -"
  game = Jumanjii.new
  game.ask_player_game_mode
end

# Run program
perform