class CreateExpertsServicesJoinTable < ActiveRecord::Migration
    def self.up
        create_table :experts_services, :id => false do |t|
            t.integer :expert_id
            t.integer :service_id
        end

        add_index :experts_services, [:expert_id, :service_id]
    end

    def self.down
        drop_table :experts_services
    end
end
