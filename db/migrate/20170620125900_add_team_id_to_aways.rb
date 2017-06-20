class AddTeamIdToAways < ActiveRecord::Migration[5.0]
  def change
    add_column :aways, :team_id, :integer
  end
end
