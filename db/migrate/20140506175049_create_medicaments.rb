class CreateMedicaments < ActiveRecord::Migration
  def change
    create_table :medicaments do |t|
      t.string :name
      t.text :content
      t.integer :service_id
      t.string :title
      t.string :description
      t.boolean :fl_show

      t.timestamps
    end
  end
end
