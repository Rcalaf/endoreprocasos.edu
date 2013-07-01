class AddImageTextToContent < ActiveRecord::Migration
  def change
    add_column :contents, :image_text, :text
  end
end
