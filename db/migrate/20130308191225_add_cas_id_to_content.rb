class AddCasIdToContent < ActiveRecord::Migration
  def change
    add_column :contents, :cas_id, :integer
  end
end
