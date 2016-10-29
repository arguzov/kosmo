class AddGenderIdToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :gender_id, :integer, default: 3
  end
end
