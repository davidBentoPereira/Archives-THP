class RemoveSpecialty < ActiveRecord::Migration[5.2]
  def change
    remove_column :doctors, :specialty
  end
end
