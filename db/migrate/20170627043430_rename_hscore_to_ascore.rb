class RenameHscoreToAscore < ActiveRecord::Migration[5.0]
  def change
  	rename_column :aways, :hscore, :ascore
  end
end
