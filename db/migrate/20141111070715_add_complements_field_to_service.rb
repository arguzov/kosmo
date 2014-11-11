class AddComplementsFieldToService < ActiveRecord::Migration
  def change
    add_column :services, :complements, :string
  end
end
