class AddRoleIdToExperts < ActiveRecord::Migration
  def change
    add_column :experts, :role_id, :integer
  end
end
