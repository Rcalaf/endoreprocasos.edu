class AddFrontFooterToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :front_footer, :text
  end
end
