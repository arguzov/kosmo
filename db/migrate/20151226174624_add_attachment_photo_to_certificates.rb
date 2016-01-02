class AddAttachmentPhotoToCertificates < ActiveRecord::Migration
  def self.up
    change_table :certificates do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :certificates, :photo
  end
end
