class AddAttachmentPhotosToExperts < ActiveRecord::Migration
  def self.up
    change_table :experts do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :experts, :photo
  end
end
