class AddCssToService < ActiveRecord::Migration
  def change
    add_column :services, :css, :text
  end
end
