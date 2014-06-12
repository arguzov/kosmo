class RemoveAnotherPhotoFromExpert < ActiveRecord::Migration
    def change
        remove_column :experts, :photos_file_name
        remove_column :experts, :photos_content_type
        remove_column :experts, :photos_file_size
        remove_column :experts, :photos_updated_at
    end
end
