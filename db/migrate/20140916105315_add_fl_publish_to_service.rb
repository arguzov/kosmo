class AddFlPublishToService < ActiveRecord::Migration
  def change
    add_column :services, :fl_publish, :boolean
  end
end
