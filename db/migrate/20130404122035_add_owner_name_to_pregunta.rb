class AddOwnerNameToPregunta < ActiveRecord::Migration
  def change
    add_column :pregunta, :owner_name, :string
  end
end
