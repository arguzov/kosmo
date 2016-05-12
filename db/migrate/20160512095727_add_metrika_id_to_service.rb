class AddMetrikaIdToService < ActiveRecord::Migration
  def change
    add_column :services, :metrika_id, :string
  end
end
