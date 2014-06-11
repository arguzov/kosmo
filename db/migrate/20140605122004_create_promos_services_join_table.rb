class CreatePromosServicesJoinTable < ActiveRecord::Migration
    def self.up
        create_table :promos_services, :id => false do |t|
            t.integer :promo_id
            t.integer :service_id
        end

        add_index :promos_services, [:promo_id, :service_id]
    end

    def self.down
        drop_table :promos_services
    end
end

