puts "Bonjour, quel est le compte à rebours ?"
print "> "
compteur = gets.to_i

while compteur >= 0
  puts compteur
compteur -= 1
end
