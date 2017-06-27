class ChangeFormatInMyMatch < ActiveRecord::Migration[5.0]
  def change
change_column :matches, :result, :string

  end
end
