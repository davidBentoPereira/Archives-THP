class CreateGossipsTags < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips_tags do |t|
      t.references :tag, index: true
      t.references :gossip, index: true
      t.timestamps null: false
    end
  end
end
