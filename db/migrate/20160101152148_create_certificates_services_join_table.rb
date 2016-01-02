class CreateCertificatesServicesJoinTable < ActiveRecord::Migration
  def self.up
    create_table :certificates_services, :id => false do |t|
      t.integer :certificate_id
      t.integer :service_id
    end

    add_index :certificates_services, [:certificate_id, :service_id]
  end

  def self.down
    drop_table :certificates_services
  end
end
