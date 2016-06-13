class CreateSectionsServicesJoinTable < ActiveRecord::Migration
    def self.up
        create_table :sections_services, :id => false do |t|
            t.integer :section_id
            t.integer :service_id
        end

        add_index :sections_services, [:section_id, :service_id]
    end

    def self.down
        drop_table :sections_services
    end
end

