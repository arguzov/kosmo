class AddAttachmentPhotoToMedicaments < ActiveRecord::Migration
  def self.up
    change_table :medicaments do |t|
      t.attachment :photos
    end
  end

  def self.down
    drop_attached_file :medicaments, :photos
  end
end
