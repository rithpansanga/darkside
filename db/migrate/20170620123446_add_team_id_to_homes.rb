class AddTeamIdToHomes < ActiveRecord::Migration[5.0]
  def change
    add_column :homes, :team_id, :integer
  end
end