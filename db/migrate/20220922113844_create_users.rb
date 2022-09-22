class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.integer :posts_counter
      t.has_many :post
      t.has_many :comment
      t.has_many :like

      t.timestamps
    end
  end
end
