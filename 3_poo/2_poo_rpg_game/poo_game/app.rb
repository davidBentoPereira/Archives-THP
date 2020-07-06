require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'

# Create two players willing to kill each other
alice = Player.new('Alice')
june = Player.new('June')

# Show current state of both players
puts "Voici l'état de chaque joueuses :"
alice.show_state
june.show_state
puts ""

# Attack phase
puts "Passons à la phase d'attaque. CA VA SAIGNEEEEEER !!!"
while alice.life_points >= 0 && june.life_points >= 0
  alice.attacks(june)
  june.life_points > 0 ? june.attacks(alice) : break
end
