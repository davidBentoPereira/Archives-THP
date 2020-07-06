puts "Bonjour, quel est ton année de naissance ?"
print "> "
anneeNaissance = gets.to_i
anneeActuelle = 2020

while anneeNaissance <= anneeActuelle
  puts anneeNaissance
  anneeNaissance += 1
end
