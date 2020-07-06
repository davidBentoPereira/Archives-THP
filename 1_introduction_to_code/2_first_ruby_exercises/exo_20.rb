puts "Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ?"
print "> "
etages = gets.to_i
etages = etages + 1

etages.times do |i|
  i.times do
    print '#'
  end
  puts ''
end