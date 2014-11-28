class AddFlStatusToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :fl_status, :integer, :default => 0
  end
end
