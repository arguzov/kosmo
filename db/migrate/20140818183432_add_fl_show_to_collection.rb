class AddFlShowToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :fl_show, :boolean
  end
end
