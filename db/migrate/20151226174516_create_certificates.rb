class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.string :name
      t.integer :fl_type
      t.text :preview
      t.text :content
      t.integer :price
      t.integer :discount
      t.integer :fl_status
    end
  end
end
