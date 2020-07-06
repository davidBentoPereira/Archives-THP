class Specialty < ApplicationRecord
  has_many :join_table_doctors_specialties
  has_many :doctors, through: :join_table_doctors_specialties
end
