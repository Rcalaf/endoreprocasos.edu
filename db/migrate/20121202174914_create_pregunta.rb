class CreatePregunta < ActiveRecord::Migration
  def change
    create_table :pregunta do |t|
      t.text :text
      t.integer :user_id
      t.integer :cas_id

      t.timestamps
    end
  end
end
