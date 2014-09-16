class AddKeysToService < ActiveRecord::Migration
  def change
    add_column :services, :keys, :string
  end
end
