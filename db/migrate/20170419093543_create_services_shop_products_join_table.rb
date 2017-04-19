class CreateServicesShopProductsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :services_shop_products, :id => false do |t|
      t.integer :product_id
      t.integer :service_id
    end

    add_index :services_shop_products, [:product_id, :service_id]
  end

  def self.down
    drop_table :services_shop_products
  end
end
