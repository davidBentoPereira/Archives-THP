puts "Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ?"
print "> "
etages = gets.to_i
etages = etages + 1

i = 0
while i < etages
  j = 0
  while j < i
    print '#'
    j = j + 1
  end
  i = i + 1
  puts ''
end