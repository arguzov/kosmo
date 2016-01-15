class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :service_id
      t.integer :parent_id, default: 0
      t.string :name
      t.integer :price, default: 0
      t.integer :old_price, default: 0
    end
  end
end
