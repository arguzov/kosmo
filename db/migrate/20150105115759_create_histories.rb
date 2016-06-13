class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :page_type
      t.integer :entity_id
      t.string :donor_url
      t.string :page_url

      t.timestamps
    end
  end
end
