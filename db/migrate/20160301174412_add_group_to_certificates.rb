class AddGroupToCertificates < ActiveRecord::Migration
  def change
    add_column :certificates, :group_id, :integer, :default => 0
  end
end
