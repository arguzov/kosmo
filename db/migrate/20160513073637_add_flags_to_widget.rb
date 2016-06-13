class AddFlagsToWidget < ActiveRecord::Migration
  def change
    add_column :widgets, :is_only, :boolean
    add_column :widgets, :is_new, :boolean
    add_column :widgets, :button_name, :string
    add_column :widgets, :metrika_id, :string
  end
end
