class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :titol
      t.integer :cas_id

      t.timestamps
    end
  end
end
