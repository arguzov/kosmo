class AddParentIdToSection < ActiveRecord::Migration
  def change
    add_column :sections, :parent_id, :integer, :default => 0
  end
end
