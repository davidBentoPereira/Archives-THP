class CreateGossipsLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips_likes do |t|
      t.references :user, index: true
      t.references :gossip, index: true
      t.timestamps null: false
    end
  end
end
