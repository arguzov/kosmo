class RemovePhotoFromExpert < ActiveRecord::Migration
  def change
      remove_column :experts, :photo
  end
end
