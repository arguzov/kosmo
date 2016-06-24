class AddFlShowToProductItem < ActiveRecord::Migration
  def change
    add_column :shop_product_items, :fl_show, :boolean, default: 1
  end
end
