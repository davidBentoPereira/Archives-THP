class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User", required: false
  belongs_to :recipient, class_name: "User", required: false

  validates :content,
            presence: true,
            length: {in: 3..300}
end
