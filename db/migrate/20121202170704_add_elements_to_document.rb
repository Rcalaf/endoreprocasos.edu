class AddElementsToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :descripcio, :string
  end
end
