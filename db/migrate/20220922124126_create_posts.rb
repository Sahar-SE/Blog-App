class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :authorId
      t.string :title
      t.string :text
      t.integer :comments_counter
      t.integer :likes_counter
      t.references :user, null: false, foreign_key: true
      t.belongs_to :user
      t.has_many :comment
      t.has_many :like
      
      t.timestamps
    end
  end
end
