class CreateIssuesServicesJoinTable < ActiveRecord::Migration
    def self.up
        create_table :issues_services, :id => false do |t|
            t.integer :issue_id
            t.integer :service_id
        end

        add_index :issues_services, [:issue_id, :service_id]
    end

    def self.down
        drop_table :issues_services
    end
end
