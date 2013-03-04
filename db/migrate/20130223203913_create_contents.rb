class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :text
      t.text :embed_code
      t.text :big_image_text
      t.text :small_image_text

      t.timestamps
    end
  end
end
