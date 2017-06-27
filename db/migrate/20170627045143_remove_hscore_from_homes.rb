class RemoveHscoreFromHomes < ActiveRecord::Migration[5.0]
  def change
  	remove_column :homes, :hscore
  end
end
