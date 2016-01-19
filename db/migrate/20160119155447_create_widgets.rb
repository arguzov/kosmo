class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :header
      t.text :content
      t.integer :position_id
      t.integer :entity_id
    end
  end
end
