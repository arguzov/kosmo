class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.integer :price_id
      t.integer :promo_id
      t.integer :service_id
      t.date :due_date
      t.integer :value
      t.integer :value_unit
      t.boolean :fl_new
      t.timestamps
    end
  end
end
