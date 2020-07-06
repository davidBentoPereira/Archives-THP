puts "Bonjour, quel est ton age ?"
print "> "
anneeActuelle = 2020
age = gets.to_i
anneeNaissance = anneeActuelle - age

i = 1

while anneeNaissance < anneeActuelle
  if (age / 2) == i
    puts "En #{anneeNaissance} tu avais la moitié de l'âge que tu as aujourd'hui"
  else
    puts "En #{anneeNaissance} tu avais #{i} ans"
  end
  i += 1
  anneeNaissance += 1
end