# frozen_string_literal: true

class Event < ApplicationRecord
  # after_create :attend_to_event_send

  def attend_to_event_send
    UserMailer.attend_to_event_email(self).deliver_now
  end

  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :author, class_name: 'User'

  # validates :start_date
            # presence: true

  # validate :start_date_is_valid_datetime

  # validate :start_date_is_greater_than_today

  validates :duration,
            presence: true

  # validate :duration_is_multiple_of_5_and_is_positive

  validates :title,
            presence: true,
            length: { minimum: 5, maximum: 140 }

  validates :description,
            presence: true,
            length: { minimum: 20, maximum: 1000, message: 'Veuillez saisir une description dont la longueur est comprise entre 20 et 1000 caractères' }

  validates :price,
            presence: true
  # inclusion: {in: [0,1000], message: "Veuillez saisir un prix dont la valeur est compris entre 1 et 1000€"}

  validates :location,
            presence: true

  private

  def start_date_is_valid_datetime
    puts ':start_date => start_date'
    puts "start_date => #{start_date}"
    if (begin
           DateTime.parse(start_date)
        rescue StandardError
          ArgumentError
         end) == ArgumentError
      errors.add(start_date, 'must be a valid datetime')
      end
  end

  def start_date_is_greater_than_today
    errors.add(start_date, "can't be past") if start_date < Time.now
  end

  def duration_is_multiple_of_5_and_is_positive
    duration >= 0 && duration % 5 === 0 ? true : false
  end
end
