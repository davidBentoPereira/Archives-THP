# frozen_string_literal: true
require 'faker'

cities = %w[Paris Bordeaux Lyon Lisbonne Madrid Annecy]

User.destroy_all
Event.destroy_all
Attendance.destroy_all

users = []
events = []

# Create Default Admin User
users << User.create!(
    first_name: "Julio",
    last_name: "Bento",
    email: "juliobento@yopmail.com",
    description: Faker::Quote.yoda,
    password: 'azerty',
    is_admin: true
)
puts "Default Admin user has been created"

35.times do |i|
  users << User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "#{Faker::Name.first_name}#{i}@yopmail.com",
    description: Faker::Quote.yoda,
    password: 'azerty',
    is_admin: false
  )

  puts "#{i + 1}/35 utilisateurs créés"
end

10.times do |i|
  events << Event.create!(
    # start_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
    start_date: Time.parse('2020-08-12'),
    duration: 5 * rand(1..100),
    title: Faker::Name.name,
    description: "Description de test qui fait au moins 20 caractères sa maman",
    price: rand(1..999),
    location: cities.sample,
    author: users.sample,
    validated: true
  )

  puts "#{i + 1}/10 évènements créés"
end

20.times do |i|
  Attendance.create!(
    user: users.sample,
    event: events.sample
  )

  puts "#{i + 1}/20 participations créés"
end
