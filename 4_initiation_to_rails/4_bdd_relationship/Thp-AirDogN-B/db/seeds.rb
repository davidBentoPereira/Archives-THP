require 'faker'
# Reset all data into database
Dog.destroy_all
Stroll.destroy_all
Dogsitter.destroy_all

# Generate 3 objects City
3.times do |i|
  City.create!(
      name: Faker::Address.city
  )
end

# Generate 10 objects into database
10.times do |i|
  dogsitter = Dogsitter.create!(
      name: Faker::FunnyName.name,
      age: rand(18..60),
      city: City.all.sample
  )
  dog = Dog.create!(
      name: Faker::FunnyName.name,
      pedigree: ["Chiwawa", "Caniche", "Bichon Maltais", "Golden Retriever", "Labradaor", "Pitbull", "Bulldog"].sample,
      city: City.all.sample
  )
  Stroll.create!(
      place: Faker::Address.full_address,
      date: Faker::Date.between(from: 2.days.ago, to: 1.year.after),
      dog: dog,
      dogsitter: dogsitter,
  )


  puts "##{i + 1}/10 Objects Doctor, Patient and Appointment were successuflly created"
end