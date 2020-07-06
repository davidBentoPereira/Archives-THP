require 'faker'

# Reset data
User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all
GossipsTag.destroy_all
GossipsLike.destroy_all
Comment.destroy_all
CommentsLike.destroy_all
CommentsComment.destroy_all
PrivateMessage.destroy_all

# Create cities
10.times do
  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip
  )
end

# Create Admin account
User.create!(
    first_name: "John",
    last_name: "Doe",
    description: Faker::Hipster.sentence(word_count: 15, supplemental: true),
    email: "admin@admin.com",
    password: "admin",
    password_confirmation: "admin",
    age: Faker::Number.within(range: 15..50),
    city: City.all.sample
)

# Create users
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Hipster.sentence(word_count: 15, supplemental: true),
    email: Faker::Internet.email,
    password: "admin",
    password_confirmation: "admin",
    age: Faker::Number.within(range: 15..50),
    city: City.all.sample
  )
end

# Create tags
10.times do
  Tag.create!(
    title: "##{Faker::Lorem.word}"
  )
end

# Create gossips
20.times do
  Gossip.create!(
    title: Faker::App.name,
    content: Faker::Hipster.sentence(word_count: 10, supplemental: true),
    user: User.all.sample
  )
end

# Create Gossips Tags
10.times do
  GossipsTag.create(
    gossip: Gossip.all.sample,
    tag: Tag.all.sample
  )
end

# Create gossips likes
20.times do
  GossipsLike.create!(
    gossip: Gossip.all.sample,
    user: User.all.sample
  )
end

# Create comments
20.times do
  Comment.create!(
    gossip: Gossip.all.sample,
    user: User.all.sample,
    content: Faker::Hipster.sentence(word_count: 40, supplemental: true)
  )
end

# Create comments likes
20.times do
  CommentsLike.create!(
    user: User.all.sample,
    comment: Comment.all.sample
  )
end

# Create comments from comments
20.times do
  CommentsComment.create!(
    user: User.all.sample,
    comment: Comment.all.sample,
    content: Faker::Lorem.sentence
  )
end

# Create private messages
10.times do
  PrivateMessage.create!(
    content: Faker::Lorem.sentence,
    recipient: User.all.sample,
    sender: User.all.sample
  )
end
