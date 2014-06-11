class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :fl_status
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
