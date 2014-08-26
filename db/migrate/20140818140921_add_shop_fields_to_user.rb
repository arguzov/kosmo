class AddShopFieldsToUser < ActiveRecord::Migration
    def change
        add_column :users, :discount, :string
        add_column :users, :name, :string
        add_column :users, :phone, :string
    end
end
