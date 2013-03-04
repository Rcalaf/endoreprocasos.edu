class AddPageIdToContent < ActiveRecord::Migration
  def change
    add_column :contents, :page_id, :integer
    add_column :contents, :content_type, :string
    add_column :contents, :position, :integer
  
  end
end
