class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.integer :service_id, default: 0
      t.text :preview
      t.text :content
      t.integer :post_id, default: 0
      t.integer :price, default: 0
      t.integer :discount, default: 0
      t.integer :fl_status, default: 0
    end
  end
end
