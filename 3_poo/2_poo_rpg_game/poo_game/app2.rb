require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'

# Display a welcome message
print "-" * 49
print"\n|Bienvenue sur 'ILS VEULENT TOUS MA POO' !|" + " " * 5 + "|"
print "\n|Le but du jeu est d'être le dernier survivant !|" + "\n" + "-" * 49
puts ""

# Create players
human_player = HumanPlayer.new("Léodagan")
bot1 = Player.new("bot1")
bot2 = Player.new("bot2")
enemies = [bot1, bot2]

def display_menu(human_player, bot1, bot2)
  # Display action menu
  puts "C'est votre tour #{human_player.name}. Que voulez-vous faire ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  if bot1.life_points > 0
    puts "1 - Attaquer #{bot1.name} (#{bot1.life_points} pv)"
  end
  if bot2.life_points > 1
    puts "2 - Attaquer #{bot2.name} (#{bot2.life_points} pv)"
  end
  print "> "

  # Handle user's choice
  choice = gets.chomp
  case choice
  when 'a'
    human_player.search_weapon
  when 's'
    human_player.search_health_pack
  when '1'
    human_player.attacks(bot1)
  when '2'
    human_player.attacks(bot2)
  else
    puts "Tu trébuche sur une bûche."
  end
end

# FIGHT !
while human_player.life_points > 0 && (bot1.life_points > 0 || bot2.life_points > 0)
  # Display action menu
  display_menu(human_player, bot1, bot2)

  # The ennemies attack you
  enemies.each do |ennemy|
    if ennemy.life_points >= 0
      puts "Les autres joueurs t'attaquent !"
      ennemy.attacks(human_player)
    end
  end
end

puts "La partie est finie"
if human_player.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end