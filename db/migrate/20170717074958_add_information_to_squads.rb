class AddInformationToSquads < ActiveRecord::Migration[5.0]
  def change
    add_column :squads, :birth, :string
    add_column :squads, :foot, :string
    add_column :squads, :nationality, :string
  end
end
