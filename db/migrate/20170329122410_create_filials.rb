class CreateFilials < ActiveRecord::Migration
  def change
    create_table :filials do |t|
      t.string :address
      t.string :phones
      t.string :email
      t.text :description
    end
  end
end
