class AddSlugToPage < ActiveRecord::Migration
  def change
    add_column :pages, :slug, :string
    add_column :pages, :public, :boolean, :default => false
    add_column :pages, :position, :integer
  end
end
