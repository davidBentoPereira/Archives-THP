class User
  attr_accessor :email, :age

  @@all_users = {}

  def initialize(email, age)
    @email = email
    @age = age
    @@all_users[email] = self
  end

  def all
    @@all_users
  end

  def self.find_by_email(email)
    @@all_users.include?(email) ? @@all_users[email] : false
  end
end