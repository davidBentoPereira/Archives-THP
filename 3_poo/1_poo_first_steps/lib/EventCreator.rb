class EventCreator
  def self.create_event
    # Get user's inputs

    puts "Salut, tu veux créer un événement ? Cool ! Commençons. Quel est le nom de l'événement ?"
    title = gets.chomp

    puts "Super. Quand aura-t-il lieu ?"
    start_date = gets.chomp

    puts "Au top. Combien de temps va-t-il durer (en minutes) ?"
    duration = gets.to_i

    puts "Génial. Qui va participer ? Balance leurs e-mails"
    attendees = gets.chomp

    puts "Super, c'est noté, ton évènement a été créé !"

    # Return instance of an event
    Event.new(start_date, duration, title, attendees)
  end
end
