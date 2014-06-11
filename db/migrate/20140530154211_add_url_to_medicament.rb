class AddUrlToMedicament < ActiveRecord::Migration
  def change
    add_column :medicaments, :url, :string
  end
end
