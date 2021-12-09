class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :comments_count, default: 0
      t.integer :likes_count, default: 0
      t.timestamps
      t.references :author, foreign_key: { to_table: :users }
    end
  end
end
