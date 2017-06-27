class RemoveAscoreFromAways < ActiveRecord::Migration[5.0]
  def change
  	remove_column :aways, :ascore
  end
end
