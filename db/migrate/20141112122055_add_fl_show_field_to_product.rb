class AddFlShowFieldToProduct < ActiveRecord::Migration
  def change
      add_column :products, :fl_show, :boolean
  end
end
