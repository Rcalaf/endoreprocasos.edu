class AddYearToCas < ActiveRecord::Migration
  def change
    add_column :cas, :year, :integer
  end
end
