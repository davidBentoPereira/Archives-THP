class City < ApplicationRecord
  has_many :users

  validates :name,
            presence: true,
            uniqueness: true,
            length: {in: 3..30}
end
