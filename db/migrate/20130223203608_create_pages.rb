class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :menu_title

      t.timestamps
    end
  end
end
