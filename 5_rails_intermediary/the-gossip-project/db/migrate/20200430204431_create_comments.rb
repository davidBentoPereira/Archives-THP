class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :gossip, index: true
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
