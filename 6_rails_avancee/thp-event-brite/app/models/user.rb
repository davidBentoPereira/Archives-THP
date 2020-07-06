# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  has_many :attendances
  has_many :events, through: :attendances
  has_many :events, foreign_key: 'author_id', class_name: 'Event'

=begin
  # validates :email,
  #           uniqueness: true,
  #           format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'Veuillez saisir une adresse email au format valide' },
  #           presence: true,
  #           length: { maximum: 256 }
  #
  # validates :encrypted_password,
  #           presence: true
  #
  # validates :description,
  #           presence: true,
  #           length: { in: 10..500 }
  #
  # validates :first_name,
  #           presence: true,
  #           length: { in: 2..30 }
  #
  # validates :last_name,
  #           presence: true,
  #           length: { in: 2..30 }
=end

  def full_name
    "#{first_name} #{last_name}"
  end
end
