class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :url
      t.integer :collection_id
      t.text :description
      t.string :volume
      t.string :articul
      t.integer :price

      t.timestamps
    end
  end
end
