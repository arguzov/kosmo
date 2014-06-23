class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :contacts
      t.text :content

      t.timestamps
    end
  end
end
