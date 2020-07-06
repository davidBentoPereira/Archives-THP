### a) Niveau facile

Quel est le nombre total d'objets Album contenus dans la base (sans regarder les id bien sûr) ?
```ruby
Album.count
```

Qui est l'auteur de la chanson "White Room" ?
```ruby
Track.find_by(title: "White Room").artist
```

Quelle chanson dure exactement 188133 milliseconds ?
```ruby
Track.find_by(duration: 188133).title
```

Quel groupe a sorti l'album "Use Your Illusion II" ?
```ruby
Album.find_by(title: "Use Your Illusion II")
```

### b) Niveau Moyen

Combien y a t'il d'albums dont le titre contient "Great" ?
```ruby
Album.where("title like '%Great%'").count
```

Supprime tous les albums dont le nom contient "music".
```ruby
Album.where("title like '%music%'").destroy_all
```

Combien y a t'il d'albums écrits par AC/DC ?
```ruby
Album.where("artist like 'AC/DC'").count
```

Combien de chanson durent exactement 158589 millisecondes ?
```ruby
Track.where(duration: 158589).count
```

### c) Niveau Difficile

Pour ces questions, tu vas devoir effectuer des boucles dans la console Rails. C'est peu commun mais c'est faisable, tout comme dans IRB.

puts en console tous les titres de AC/DC.
```ruby
Track.where("artist LIKE 'AC/DC'").each do |track|
    puts track.i
end
```

puts en console tous les titres de l'album "Let There Be Rock".
```ruby
Track.where("album LIKE 'Let There Be Rock'").each do |track|
    puts track.title
end
```

Calcule le prix total de cet album ainsi que sa durée totale.
```ruby
price = 0
duration = 0
Track.where("album LIKE 'Let There Be Rock'").each do |track|
    price += track.price
    duration += track.duration
end
puts "Price: #{price} - Duration: #{duration}"
```

Calcule le coût de l'intégralité de la discographie de "Deep Purple".
```ruby
price = 0
Track.where("artist LIKE 'Deep Purple'").each do |track|
    price += track.price
end
puts "Price: #{price}"
```

Modifie (via une boucle) tous les titres de "Eric Clapton" afin qu'ils soient affichés avec "Britney Spears" en artist.
```ruby
a_clapton = Track.where(artist: "Eric Clapton")
a_clapton.each do |track|
    track.artist = "Britney Spears"
end
tp a_clapton
```
