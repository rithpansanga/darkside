class AddHscoreToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :hscore, :integer
  end
end
