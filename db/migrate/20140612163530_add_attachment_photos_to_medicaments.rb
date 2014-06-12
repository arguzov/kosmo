class AddAttachmentPhotosToMedicaments < ActiveRecord::Migration
  def self.up
    change_table :medicaments do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :medicaments, :photo
  end
end
