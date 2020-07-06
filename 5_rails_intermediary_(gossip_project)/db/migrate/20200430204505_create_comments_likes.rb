class CreateCommentsLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :comments_likes do |t|
      t.references :user, index: true
      t.references :comment, index: true
      t.timestamps null: false
    end
  end
end
