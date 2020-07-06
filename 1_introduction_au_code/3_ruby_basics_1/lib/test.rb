def ask_nb
  puts "Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ?"
  nb = gets.to_i
end

def full_pyramid(nb)
  nb.times do |n|
    print " " * (nb - n)
      puts "#" * (2 * n + 1)
    end
end

full_pyramid(ask_nb)