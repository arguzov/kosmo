class CreateShopProducts < ActiveRecord::Migration
  def change
    create_table :shop_products do |t|
      t.string :name
      t.string :url
      t.integer :category_id
      t.text :description
      t.boolean :fl_show
    end
  end
end
