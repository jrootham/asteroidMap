class AddAttachmentImageToGaleries < ActiveRecord::Migration
  def self.up
    change_table :galeries do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :galeries, :image
  end
end
