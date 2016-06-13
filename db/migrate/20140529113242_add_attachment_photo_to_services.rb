class AddAttachmentPhotoToServices < ActiveRecord::Migration
  def self.up
    change_table :services do |t|
      t.attachment :photos
    end
  end

  def self.down
    drop_attached_file :services, :photos
  end
end
