class AddDiscountToPrice < ActiveRecord::Migration
  def change
    add_column :prices, :discount, :integer
    add_column :prices, :is_new_only, :boolean
  end
end
