class AddUnitIdToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :unit_id, :integer
  end
end
