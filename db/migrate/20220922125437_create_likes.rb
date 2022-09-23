class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :authorId
      t.integer :postId
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.belongs_to :user
      t.belongs_to :post

      t.timestamps
    end
  end
end
