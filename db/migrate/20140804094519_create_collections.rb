class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name
      t.string :url
      t.text :description

      t.timestamps
    end
  end
end
