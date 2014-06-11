class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.string :name
      t.text :content
      t.text :banner
      t.boolean :fl_active
      t.boolean :fl_top
      t.datetime :due

      t.timestamps
    end
  end
end
