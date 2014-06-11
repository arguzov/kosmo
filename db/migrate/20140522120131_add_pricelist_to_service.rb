class AddPricelistToService < ActiveRecord::Migration
  def change
    add_column :services, :pricelist, :text
  end
end
