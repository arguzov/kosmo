class AddParentAndOrderToUnit < ActiveRecord::Migration
  def change
    add_column :units, :parent, :integer
  end
end
