class RemoveColsFromProduct < ActiveRecord::Migration
  def change
      remove_column :products, :articul
      remove_column :products, :volume
      remove_column :products, :price
      add_column :products, :prices, :text
  end
end
