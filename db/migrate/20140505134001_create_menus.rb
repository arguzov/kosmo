class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title
      t.string :url
      t.integer :fl_type
      t.integer :parent_id
      t.integer :post_id
      t.integer :category_id
    end
  end
end
