require 'faker'
# Reset all data into database
User.destroy_all
City.destroy_all

# Generate 3 cities into database
3.times do |i|
  City.create!(
      name: Faker::FunnyName.name,
      zip_code: Faker::Address.zip_code,
      )
  puts "##{i + 1}/3 cities were successuflly created"
end

# Generate 10 objects into database
10.times do |i|
  User.create!(
      first_name: Faker::Name.first_name_women,
      last_name: Faker::Name.last_name,
      description: Faker::Lorem.sentences,
      email: Faker::Internet.email,
      age: rand(18..60),
      city: City.all.sample
  )
  puts "##{i + 1}/10 Objects were successuflly created"
end