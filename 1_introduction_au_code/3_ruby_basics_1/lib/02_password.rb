def signup
  puts "Wesh gros, choisi un mot de passe stp ?"
  print '> '
  password = gets.chomp
  puts "Ton mot de passe est enregistré. Retiens-le bien car si tu le perds t'es marron."
  return password
end

def login(password)
  puts "Wesh pelo, le videur ici c'est moi. On m'appelle le parfeu dans le milieu. Tu penses rentrer comme ça ?
        Refiles-moi ton mot de passe et y'aura p'têtre moyen de moyenner un arrangement
        (n'hésites pas à me graisser la patte, je dis pas que ça peut aider mais le boulot de parfeu c'est pas forcément une bonne situation donc on sait jamais)."
  print '> '
  typed_password = gets.chomp
  if typed_password === password
    welcome_screen
  else
    puts "C'est pas le bon mot de passe. Casses-toi. JE T'AI DIT DE TE CASSER D'ICI PTIT MARIOL !!! ET REVIENS PLUS JOUER LES MARLON BRANDO SOUS MON COMPTOIR !"
    login(password)
  end
end

def welcome_screen
  puts "Wesh l'ami, bienvenu dans la zone 51. Si tu viens pour les aliens, y'en a pas. #Sorry #NotSorry"
end

def perform
  password = signup
  login(password)
end

perform