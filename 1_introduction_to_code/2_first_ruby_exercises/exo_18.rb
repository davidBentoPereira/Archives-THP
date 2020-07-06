emails = []

i = 1

50.times do
  emails[i] = "\"jean.dupont.#{i.to_s.rjust(2,'0')}@email.fr\""
  i = i + 1
end

emails.each do |email|
  puts email
end