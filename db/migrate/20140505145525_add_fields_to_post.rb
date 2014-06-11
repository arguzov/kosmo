class AddFieldsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :fl_menu, :bool
  end
end
