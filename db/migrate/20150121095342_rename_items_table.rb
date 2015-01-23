class RenameItemsTable < ActiveRecord::Migration
  def up
    rename_table :items, :shop_product_items
    add_column :shop_product_items, :color, :string
    add_column :shop_product_items, :unit, :string
    remove_column :shop_product_items, :created_at
    remove_column :shop_product_items, :updated_at
  end
  def down
    rename_table :shop_product_items, :items
    remove_column :items, :color, :string
    remove_column :items, :unit, :string
    add_column :items, :created_at, :datetime
    add_column :items, :updated_at, :datetime
  end
end
