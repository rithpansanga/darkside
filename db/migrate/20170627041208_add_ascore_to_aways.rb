class AddAscoreToAways < ActiveRecord::Migration[5.0]
  def change
    add_column :aways, :hscore, :integer
  end
end
