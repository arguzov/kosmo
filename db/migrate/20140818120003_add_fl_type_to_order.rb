class AddFlTypeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :fl_type, :integer, :default => 1
  end
end
