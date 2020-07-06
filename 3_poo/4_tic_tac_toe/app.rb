require 'bundler'
Bundler.require

require_relative './lib/app/tictactoe'
require_relative './lib/app/player'

# Start Tic Tac Toe game
tic_tac_toe = TicTacToe.new
tic_tac_toe = TicTacToe.new

# Display start message
tic_tac_toe.start_message
puts ""
puts ""

# Ask players to give their names and instanciates two Players
tic_tac_toe.players << Player.new("X")
tic_tac_toe.players << Player.new("O")
puts ""

tic_tac_toe.launch_game