puts "Bonjour, quel est ton age ?"
print "> "
anneeActuelle = 2020
age = gets.to_i
anneeNaissance = anneeActuelle - age

i = 1

    while anneeNaissance < anneeActuelle
  puts "En #{anneeNaissance} tu avais #{i} ans"
  i += 1
  anneeNaissance += 1
end