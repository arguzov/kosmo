class AddIsStructuredToService < ActiveRecord::Migration
  def change
    add_column :services, :is_structured, :boolean, default: false
  end
end
