class CreateCas < ActiveRecord::Migration
  def change
    create_table :cas do |t|
      t.string :titol
      t.text :descripcio

      t.timestamps
    end
  end
end
