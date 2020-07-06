puts "Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ?"
print "> "
etages = gets.to_i
etages = etages + 1

espaces = etages - 1
etage_actuelle = 0

etages.times do |i|
  espaces.times do
    print ' '
  end

  etage_actuelle.times do |i|
    print '#'
  end

  espaces = espaces - 1
  etage_actuelle = etage_actuelle + 1

  puts ' '
end