class CreateConsulta < ActiveRecord::Migration
  def change
    create_table :consulta do |t|
      t.string :name
      t.string :email
      t.text :mensaje

      t.timestamps
    end
  end
end
