class CreatePartsShopProductsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :parts_shop_products, :id => false do |t|
      t.integer :part_id
      t.integer :product_id
    end

    add_index :parts_shop_products, [:product_id, :part_id]
  end

  def self.down
    drop_table :parts_shop_products
  end
end
