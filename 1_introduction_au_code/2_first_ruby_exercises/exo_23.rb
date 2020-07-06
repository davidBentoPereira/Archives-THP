puts "Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ?"
print "> "
etages = gets.to_i
etages = etages + 1

espaces = etages - 1
etage_actuelle = 0

i = 0
while i < etages
  j = 0
  while j < espaces
    print ' '
    j = j + 1
  end
  espaces = espaces - 1

  k = 0
  while k < etage_actuelle
    print '#'
    k = k + 1
  end
  etage_actuelle = etage_actuelle + 1

  i = i + 1
  puts ' '
end