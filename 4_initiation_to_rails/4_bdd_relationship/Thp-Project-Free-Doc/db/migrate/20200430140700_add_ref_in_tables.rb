class AddRefInTables < ActiveRecord::Migration[5.2]
  def change
    add_reference :doctors, :city, index: true
    add_reference :patients, :city, index: true
    add_reference :appointments, :city, index: true
  end
end
