class CreateMetrikas < ActiveRecord::Migration
  def change
    create_table :metrikas do |t|
      t.integer :service_id
      t.integer :action_id
      t.string :ip
      t.timestamps
    end
  end
end
