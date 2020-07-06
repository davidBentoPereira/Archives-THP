class Player
  attr_accessor :name, :mark, :score

  def initialize(mark)
    @name = ask_name
    @mark = mark
    @score = 0
  end

  # Ask player1's name or player2's name
  def ask_name
    puts "\e[33mWhat is your name ?"
    print "\e[39m> "
    gets.chomp
  end
end