class AddFlMenuToPromo < ActiveRecord::Migration
  def change
    add_column :promos, :fl_menu, :boolean
  end
end
