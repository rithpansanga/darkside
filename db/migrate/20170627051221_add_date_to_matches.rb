class AddDateToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :day, :integer
    add_column :matches, :month, :integer
    add_column :matches, :year, :integer
  end
end
