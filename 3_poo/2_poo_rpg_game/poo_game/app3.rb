require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'

# Initiate game && create human_players && create a defined number of bots
fortnite = Game.new("Léodagan", 2, 5)

# Display a welcome message
fortnite.welcome

# FIGHT !
while fortnite.is_still_ongoing?
  # Add new bot to the game
  fortnite.new_players_in_sight
  puts ""

  # Display state of all the players
  fortnite.show_players
  puts ""

  # Display action menu
  choice = fortnite.menu

  # Human player attacks
  fortnite.menu_choice(choice)
  puts ""

  # The ennemies attack you
  fortnite.enemies_attack
  puts ""
  
  puts "-" * 50
end

fortnite.end