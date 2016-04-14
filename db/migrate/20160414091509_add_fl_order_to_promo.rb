class AddFlOrderToPromo < ActiveRecord::Migration
  def change
    add_column :promos, :fl_order, :integer, :default => 99
  end
end
