class AddAttachmentPhotoToSections < ActiveRecord::Migration
  def self.up
    change_table :sections do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :sections, :photo
  end
end
