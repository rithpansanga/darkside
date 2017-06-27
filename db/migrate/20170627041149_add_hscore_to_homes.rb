class AddHscoreToHomes < ActiveRecord::Migration[5.0]
  def change
    add_column :homes, :hscore, :integer
  end
end
