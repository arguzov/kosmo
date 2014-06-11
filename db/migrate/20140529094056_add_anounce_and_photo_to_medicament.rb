class AddAnounceAndPhotoToMedicament < ActiveRecord::Migration
  def change
    add_column :medicaments, :anounce, :text
  end
end
