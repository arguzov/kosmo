class AddFlBestSellerFieldToShopProductItem < ActiveRecord::Migration
  def change
      add_column :shop_product_items, :fl_best_seller, :boolean
  end
end
