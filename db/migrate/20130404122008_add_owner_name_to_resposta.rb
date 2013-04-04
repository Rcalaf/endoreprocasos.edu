class AddOwnerNameToResposta < ActiveRecord::Migration
  def change
    add_column :resposta, :owner_name, :string
  end
end
