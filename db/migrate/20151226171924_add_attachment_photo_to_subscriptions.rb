class AddAttachmentPhotoToSubscriptions < ActiveRecord::Migration
  def self.up
    change_table :subscriptions do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :subscriptions, :photo
  end
end
