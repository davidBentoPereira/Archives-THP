require 'time'

require_relative 'lib/User'
require_relative 'lib/Event'
require_relative 'lib/EventCreator'

# Méthode Statique (= Méthode de classe)
la_bute_au_cerf = EventCreator.create_event

# Méthode objet
# event_generator = EventCreator.new
# la_bute_au_cerf = event_generator.create_event

puts la_bute_au_cerf.title