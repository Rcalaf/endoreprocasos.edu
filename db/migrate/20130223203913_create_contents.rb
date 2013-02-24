class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :text
      t.text :mini_text

      t.timestamps
    end
  end
end
