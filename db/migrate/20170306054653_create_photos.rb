class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.integer :service_id
      t.integer :photo_type
      t.integer :photo_group
      t.text :description
      t.timestamps
    end
  end
end
