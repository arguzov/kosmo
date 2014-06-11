class AddFieldsToService < ActiveRecord::Migration
  def change
    add_column :services, :anounce, :text
    add_column :services, :price, :integer
  end
end
