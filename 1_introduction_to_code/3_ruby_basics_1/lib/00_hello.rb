def ask_first_name
  puts "Wesh pelo c'est quoi ton blaze ?"
  print "> "
  gets.chomp
end

def say_hello(first_name)
  puts "> Wesh #{first_name} *en regardant dans les yeux* (parce que si tu ne regardes pas dans les yeux tu te fais niquer la mère de ta mère pour enfin te faire niquer ta mère #cimetièreCommunal)"
end

say_hello(ask_first_name)