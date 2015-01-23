class ChangeUnitFieldTypeInShopProductItem < ActiveRecord::Migration
  def change
    change_column :shop_product_items, :unit, :integer
  end
end
