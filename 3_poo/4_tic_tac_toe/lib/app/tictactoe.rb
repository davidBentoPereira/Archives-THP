class TicTacToe
  attr_accessor :grid, :players, :winner, :nb_turn

  def initialize
    @players = []
    @grid = []
    @nb_turn = 0
    reset_grid
  end

  # Display an example grid showing what instruction you can type to put your mark + the current game grid
  def display_grids
    print "\e[39m"
    puts "|tl|tc|tr|" + " " * 5 + "|#{@grid[0]}|#{@grid[1]}|#{@grid[2]}|"
    puts "|ml|mc|mr|" + " " * 5 + "|#{@grid[3]}|#{@grid[4]}|#{@grid[5]}|"
    puts "|bl|bc|br|" + " " * 5 + "|#{@grid[6]}|#{@grid[7]}|#{@grid[8]}|"
  end

  # Reset the game's grid by removing all players' marks
  def reset_grid
    (0..8).each do |i|
      @grid[i] = " "
    end
  end

  # Display a message for game's begininng
  def start_message
    print "\e[95m-" * 49
    print "\n\e[95m|You've just launched a Tic Tac Toe game !" + " " * 6 + "|"
    print "\n" + "-" * 49
  end

  def end_message
    puts ""
    puts "End of the game. Scores : "
    puts "#{@players[0].name} #{@players[0].score}"
    puts "#{@players[1].name} #{@players[1].score}"
  end

  # Show which player has won the turn
  def show_winner
    if @nb_turn < 9
      player = @winner === "X" ? @players[0] : @players[1]
      puts "\e[95mPlayer #{player.name} won the game !"
      player.score += 1
    else
      puts "Match nul !"
    end
  end

  # Return true if there is a winner, and set @winner
  def is_there_a_winner?
    winning_possibilities = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], # Test rows
        [0, 3, 6], [1, 4, 5], [2, 7, 8], # Test columns
        [0, 4, 8], [6, 4, 2], # Test diagonals
    ]

    ['X', 'O'].each do |mark|
      winning_possibilities.each do |possibility|
        if @grid[possibility[0]] === mark && @grid[possibility[1]] === mark && @grid[possibility[2]] === mark
          @winner = mark
          return true
        end
      end
    end

    false
  end

  # Return true if game is draw (all cells aren't empty)
  def is_game_draw?
    @nb_turn >= 9 ? true : false
  end

  # Handle player's choice to put his 'mark' on the 'move' position
  def choose_action(mark)
    # Gets player's input
    print "\e[39m > "
    move = gets.chomp

    # Declare all possibles moves
    possible_choices = {0 => 'tl', 1 =>'tc', 2 =>'tr', 3 =>'ml', 4 => 'mc', 5 => 'mr', 6 => 'bl', 7 => 'bc', 8 => 'br'}

    # If user's move is one of the possible choices
    if possible_choices.values.include?(move)
      # Iterate over all the possible choices
      possible_choices.each do |key, value|
        # If one of the possible choices correspond to user's choice
        if move === value
          # Checks if the grid's case isn't already filled
          if @grid[key] != " " # TODO replace by .empty
            puts "This case isn't available anymore. Please choose another one."
            choose_action(mark)
          # If grid's case isn't filled, put user's mark in it
          else
            @grid[key] = mark
          end
        end
      end
    # Else this means user has input a wrong choice, so we force him to start again
    else
      puts "Choice error. You must select one of the following option"
      choose_action(mark)
    end
  end

  # Return true if game is ongoing
  def is_ongoing?
    (0..8).each do |i|
      if @grid[i].empty
        return true
      end
    end

    false
  end

  # Ask player
  def ask_player_its_move(player)
    puts "\e[33mIt's \e[91m#{player.name}\e[33m's turn. Put a \e[91m#{player.mark} \e[33minto the grid :"
    puts ""
    display_grids
    puts ""
    choose_action(player.mark)

    @nb_turn = @nb_turn + 1
  end

  def show_play_again_menu
    puts ""
    puts "Play again ?"
    puts "1 - Yes"
    puts "2 - No"
    puts "3 - Fuck off"
    print "> "
    choice = gets.chomp

    if choice === "1"
      # Reset grid and number of turns
      reset_grid
      @nb_turn = 0
      launch_game
    elsif choice === "2"
      # Stop the game
      end_message
    elsif choice === "3"
      # Stop the game
      puts "Fuck off yourself dude."
      end_message
    else
      puts "Wront input. Select another option."
      show_play_again_menu
    end
  end

  # Let the user decide if he wants to play again
  def play_again
    # Reset the grid
    reset_grid

    # Launch a new game
    launch_game
  end

  # Run the complete program
  def launch_game
    # While nobody win, do...
    while !is_there_a_winner? && !is_game_draw?
      # Ask Player 1 to make a move
      ask_player_its_move(@players[0])

      # If Player 1 win, stop the game
      if is_there_a_winner? || is_game_draw?
        next
      end

      # Ask Player 2 to make a move
      ask_player_its_move(@players[1])
    end

    # Show the winner
    display_grids
    puts ""
    show_winner

    # Ask players to play again
    show_play_again_menu
  end
end