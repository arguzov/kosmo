class AddManagerFieldsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :comment, :text
    add_column :orders, :manager_id, :integer, :default => 0
  end
end
