class AddDateToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :date, :datetime
    remove_column :matches, :day
    remove_column :matches, :month
    remove_column :matches, :year

  end
end
