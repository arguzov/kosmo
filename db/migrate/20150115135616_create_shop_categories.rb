class CreateShopCategories < ActiveRecord::Migration
  def change
    create_table :shop_categories do |t|
      t.string :name
      t.string :url
      t.text :description
      t.integer :parent_id
      t.boolean :fl_show
    end
  end
end
