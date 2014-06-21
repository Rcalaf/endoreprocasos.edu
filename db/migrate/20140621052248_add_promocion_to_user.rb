class AddPromocionToUser < ActiveRecord::Migration
  def change
    add_column :users, :promocion, :string
  end
end
