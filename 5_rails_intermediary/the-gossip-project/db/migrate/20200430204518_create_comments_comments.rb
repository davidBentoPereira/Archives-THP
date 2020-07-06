class CreateCommentsComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments_comments do |t|
      t.text :content
      t.references :user, index: true
      t.references :comment, index: true
      t.timestamps null: false
    end
  end
end
