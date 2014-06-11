class AddParentIdToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :parent_id, :integer
  end
end
