class User < ApplicationRecord
  has_secure_password

  validates :password_confirmation, presence: true

  belongs_to :city
  has_many :gossips
  has_many :comments
  has_many :gossips_likes
  has_many :comments_likes

  validates :first_name,
            presence: true,
            length: {in: 3..30}
  validates :last_name,
            presence: true,
            length: {in: 3..30}
  validates :email,
            presence: true,
            uniqueness: true,
            length: {in: 5..100},
            format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Wrong email format" }

  # Returns user's full_name
  def full_name
    "#{first_name} #{last_name}"
  end
end
