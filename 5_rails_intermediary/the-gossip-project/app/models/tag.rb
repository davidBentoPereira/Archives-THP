class Tag < ApplicationRecord
  has_many :gossips

  validates :title, length: {in: 3..14}
end
