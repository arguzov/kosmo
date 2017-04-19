class AddBrandIdToShopProductsTable < ActiveRecord::Migration
  def change
    add_column :shop_products, :brand_id, :integer
  end
end
