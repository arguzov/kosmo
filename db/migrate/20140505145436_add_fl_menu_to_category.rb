class AddFlMenuToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :fl_menu, :bool
  end
end
