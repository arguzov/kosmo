class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.integer :category_id
      t.integer :user_id
      t.integer :fl_status
      t.text :anounce
      t.text :content
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
