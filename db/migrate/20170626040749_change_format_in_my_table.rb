class ChangeFormatInMyTable < ActiveRecord::Migration[5.0]
  def change

  	 change_column :matches, :result, :integer

  end
end
