class AddQtyFieldsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :qty, :integer
    add_column :orders, :price, :integer
  end
end
