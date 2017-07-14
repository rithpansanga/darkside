class AddXlToSquads < ActiveRecord::Migration[5.0]
  def change
    add_column :squads, :xl, :integer

  end
end
