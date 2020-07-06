class EditStroll < ActiveRecord::Migration[5.2]
  def change
    add_reference :strolls, :dog, index: true
    add_reference :strolls, :dogsitter, index: true
  end
end
