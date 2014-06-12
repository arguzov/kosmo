class RemovePhotoFromService < ActiveRecord::Migration
    def change
        remove_column :services, :photos_file_name
        remove_column :services, :photos_content_type
        remove_column :services, :photos_file_size
        remove_column :services, :photos_updated_at
    end
end
