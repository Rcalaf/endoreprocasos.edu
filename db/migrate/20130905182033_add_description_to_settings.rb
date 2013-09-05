class AddDescriptionToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :main_description, :string
  end
end
