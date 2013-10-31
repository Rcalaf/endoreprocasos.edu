class AddAttachmentThumbToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :thumb
    end
  end

  def self.down
    drop_attached_file :users, :thumb
  end
end
