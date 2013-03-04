class AddAttachmentImageToContents < ActiveRecord::Migration
  def self.up
    change_table :contents do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :contents, :image
  end
end
