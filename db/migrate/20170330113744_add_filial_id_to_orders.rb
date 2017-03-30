class AddFilialIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :filial_id, :integer
  end
end
