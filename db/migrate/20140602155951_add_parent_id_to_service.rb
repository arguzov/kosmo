class AddParentIdToService < ActiveRecord::Migration
  def change
    add_column :services, :parent_id, :integer,:default => 0

  end
end
