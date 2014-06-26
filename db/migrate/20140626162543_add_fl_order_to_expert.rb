class AddFlOrderToExpert < ActiveRecord::Migration
  def change
    add_column :experts, :fl_order, :integer
  end
end
