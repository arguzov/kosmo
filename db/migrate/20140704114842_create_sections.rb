class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :fl_order

      t.timestamps
    end
  end
end
