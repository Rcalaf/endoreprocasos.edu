class AddHiddenToCas < ActiveRecord::Migration
  def change
    add_column :cas, :hidden, :boolean
  end
end
