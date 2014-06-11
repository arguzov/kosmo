class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.text :content
      t.string :title
      t.string :description
      t.boolean :fl_show

      t.timestamps
    end
  end
end
