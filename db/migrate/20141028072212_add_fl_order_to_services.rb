class AddFlOrderToServices < ActiveRecord::Migration
  def change
      add_column :services, :fl_order, :integer, :default => 0
  end
end
