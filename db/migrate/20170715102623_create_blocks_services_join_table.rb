class CreateBlocksServicesJoinTable < ActiveRecord::Migration
  def self.up
    create_table :blocks_services, :id => false do |t|
      t.integer :block_id
      t.integer :service_id
      t.integer :order_number, :default => 0
    end

    add_index :blocks_services, [:block_id, :service_id]
  end

  def self.down
    drop_table :blocks_services
  end
end
