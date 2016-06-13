class AddAttachmentPhotoToPromos < ActiveRecord::Migration
  def self.up
    change_table :promos do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :promos, :photo
  end
end
