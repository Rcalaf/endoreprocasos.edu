class AddHomeToPage < ActiveRecord::Migration
  def change
    add_column :pages, :home, :boolean
  end
end
