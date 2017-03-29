class CreateFilialsServicesJoinTable < ActiveRecord::Migration
  def self.up
    create_table :filials_services, :id => false do |t|
      t.integer :filial_id
      t.integer :service_id
    end

    add_index :filials_services, [:filial_id, :service_id]
  end

  def self.down
    drop_table :filials_services
  end
end
