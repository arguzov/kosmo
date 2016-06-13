class RemovePhotoFromMedicament < ActiveRecord::Migration
    def change
        remove_column :medicaments, :photos_file_name
        remove_column :medicaments, :photos_content_type
        remove_column :medicaments, :photos_file_size
        remove_column :medicaments, :photos_updated_at
    end
end
