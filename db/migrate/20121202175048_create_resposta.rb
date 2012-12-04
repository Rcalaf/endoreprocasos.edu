class CreateResposta < ActiveRecord::Migration
  def change
    create_table :resposta do |t|
      t.text :text
      t.integer :user_id
      t.integer :pregunta_id

      t.timestamps
    end
  end
end
