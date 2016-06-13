class AddClassToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :css_class, :string
  end
end
