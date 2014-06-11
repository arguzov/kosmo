class AddFieldsToExpert < ActiveRecord::Migration
  def change
    add_column :experts, :education, :text
    add_column :experts, :experience, :text
    add_column :experts, :diploma, :text
  end
end
