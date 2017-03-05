class AddEmailToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :email_address, :string
  end
end
