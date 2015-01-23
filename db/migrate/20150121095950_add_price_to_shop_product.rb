class AddPriceToShopProduct < ActiveRecord::Migration
  def change
    add_column :shop_products, :price, :integer
  end
end
