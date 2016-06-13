class AddAttachmentPhotoToExperts < ActiveRecord::Migration
  def self.up
    change_table :experts do |t|
      t.attachment :photos
    end
  end

  def self.down
    drop_attached_file :experts, :photos
  end
end
