class CreateIssuesShopProductsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :issues_shop_products, :id => false do |t|
      t.integer :product_id
      t.integer :issue_id
    end

    add_index :issues_shop_products, [:product_id, :issue_id]
  end

  def self.down
    drop_table :issues_shop_products
  end
end
