# Ask user the number of floors to build the pyramid
def ask_user_numbers_of_floors
  puts "Salut, tu veux une pyramide ? Ok, combien d'étages veux-tu ? (un nombre impair stp)"
  print "> "
  floor = gets.to_i
  floor = floor + 1

  if floor % 2 > 0
    puts "Tu bite rien à rien mon coco, je t'ai demandé de saisir un nombre impair ! Recommences ! "
    ask_user_numbers_of_floors
  else
    floor
  end
end

# Build half of a pyramid
def half_pyramid(floor)
  current_floor = 0

  floor.times do |i|
    puts ' ' * floor + '#' * current_floor

    floor = floor - 1
    current_floor = current_floor + 1
  end
end

# Build a proper pyramid
def full_pyramid(floor)
  current_floor = 1
  nb_blank = floor
  i = 1
  while i < floor
    puts (' ' * nb_blank) + ('#' * current_floor)

    nb_blank = nb_blank - 1
    current_floor = current_floor + 2
    i = i + 1
  end
end

# Build a proper pyramid
def wtf_pyramid(floor)
  floor = floor / 2
  # Call this method to build the top of the pyramid
  full_pyramid(floor)

  current_floor = floor * 2 - 1
  nb_blank = 1
  i = 0

  while i < floor
    puts (' ' * nb_blank) + ('#' * current_floor)

    current_floor = current_floor - 2
    nb_blank = nb_blank + 1
    i = i + 1
  end
end

# Run the program
half_pyramid(ask_user_numbers_of_floors)
full_pyramid(ask_user_numbers_of_floors)
wtf_pyramid(ask_user_numbers_of_floors)
