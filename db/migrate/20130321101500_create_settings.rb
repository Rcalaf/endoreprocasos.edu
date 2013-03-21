class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.text :footer
      t.string :main_title
      t.string :subtitle

      t.timestamps
    end
  end
end
