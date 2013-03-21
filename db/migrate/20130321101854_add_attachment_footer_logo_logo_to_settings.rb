class AddAttachmentFooterLogoLogoToSettings < ActiveRecord::Migration
  def self.up
    change_table :settings do |t|
      t.attachment :footer_logo
      t.attachment :logo
    end
  end

  def self.down
    drop_attached_file :settings, :footer_logo
    drop_attached_file :settings, :logo
  end
end
