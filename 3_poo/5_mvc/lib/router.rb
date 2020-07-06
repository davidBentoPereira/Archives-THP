require './lib/controller'

class Router
  attr_accessor :controller

  def initialize
    @controller =  Controller.new
  end

  def perform
    puts "BIENVENUE DANS THE GOSSIP PROJECT"

    while true
      #on affiche le menu
      puts "-" * 50
      puts "Tu veux faire quoi jeune mouss' ?"
      puts ""
      puts "1. Je veux créer un gossip"
      puts "2. Afficher tous les potins"
      puts "3. Supprimer un potin"
      puts "4. Je veux quitter l'app"
      puts ""
      print "> "
      params = gets.chomp.to_i #on attend le choix de l'utilisateur
      puts ""

      case params #en fonction du choix
      when 1
        puts "Tu as choisi de créer un gossip"
        @controller.create_gossip
      when 2
        @controller.index_gossips
      when 3
        @controller.destroy_gossip
      when 4
        puts "À bientôt !"
        break #Ce "break" permet de sortir de la boucle while. C'est même la seule façon d'en sortir.
      else
        puts "Ce choix n'existe pas, merci de ressayer"
      end
    end
  end
end
