class Game
  attr_accessor :human_player, :enemies_in_sight, :players_left

  def initialize(human_player_name, initial_bot_number, max_numb_of_players)
    # Create the human player
    @human_player = HumanPlayer.new(human_player_name)

    @players_left = max_numb_of_players
    @enemies_in_sight = []
    # Create an array of bots
    initial_bot_number.times do |i|
      @enemies_in_sight << Player.new("bot_#{rand(10..10000)}")
    end
  end

  # Remove a bot from the @enemies array
  def kill_player(player)
    @enemies_in_sight.delete(player)
    @players_left -= 1
  end

  # Return true if the game is still ongoing
  def is_still_ongoing?
    human_player.life_points > 0 && !@enemies_in_sight.empty?
  end

  def new_players_in_sight
    if @enemies_in_sight.count === @players_left
      puts "Tous les joueurs sont déjà en vue"
    else
      throwed_dice = rand(1..6)
      if throwed_dice === 1
        puts "Aucun nouveau joueur n'apparaît durant ce tour."
      elsif throwed_dice >= 2 && throwed_dice <= 4
        @enemies_in_sight << bot = Player.new("bot_#{rand(10..10000)}")
        puts "Le joueur #{bot.name} apparaît pour vous jouer un mauavais tour"
      elsif throwed_dice >=5
        @enemies_in_sight << bot1 = Player.new("bot_#{rand(10..10000)}")
        @enemies_in_sight << bot2 = Player.new("bot_#{rand(10..10000)}")
        puts "Le joueur #{bot1.name} apparaît pour vous jouer un mauavais tour"
        puts "Le joueur #{bot2.name} apparaît pour vous jouer un mauavais tour"
      end
    end
  end

  # Show human player's state and number of enemies still alive
  def show_players
    @human_player.show_state
    puts "Il reste #{@enemies_in_sight.count} bots à abattre"
  end

  # Display a menu with actions runnable by the human player
  def menu
    puts "C'est votre tour #{human_player.name}. Que voulez-vous faire ?"
    puts "a - Chercher une meilleure arme"
    puts "s - Chercher un kit de soin pour régénérer ses pv"

    i = 1
    @enemies_in_sight.each do |enemy|
      puts "#{i} - Attaquer #{enemy.name} (#{enemy.life_points} pv)"
      i += 1
    end

    print "> "
    gets.chomp
  end

  # Allow the user to choose an action to run
  def menu_choice(choice)
    if choice == 'a'
      @human_player.search_weapon
    elsif choice == 's'
      @human_player.search_health_pack
    elsif choice.to_i > 0
      choice = choice.to_i
      @human_player.attacks(@enemies_in_sight[choice - 1])
      if @enemies_in_sight[choice - 1].life_points <= 0
        kill_player(@enemies_in_sight[choice - 1])
      end
    else
      puts "Tu trébuche sur une bûche."
    end
  end

  # Make all enemies attacks the human player
  def enemies_attack
    puts "Les autres joueurs t'attaquent !"

    @enemies_in_sight.each do |ennemy|
      ennemy.attacks(human_player)
      if @human_player.life_points <= 0
        break
      end
    end
  end

  # Display a welcome message
  def welcome
    print "-" * 49
    print"\n|Bienvenue sur 'ILS VEULENT TOUS MA POO' !|" + " " * 5 + "|"
    print "\n|Le but du jeu est d'être le dernier survivant !|" + "\n" + "-" * 49
    puts ""
  end

  # Display a message saying the game is finished
  def end
    puts "La partie est finie"
    if human_player.life_points > 0
      puts "BRAVO ! TU AS GAGNE !"
    else
      puts "Loser ! Tu as perdu !"
    end
  end
end