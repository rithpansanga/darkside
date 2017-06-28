class AddTeamIdAndMatchIdToScoretables < ActiveRecord::Migration[5.0]
  def change
  	add_column :scoretables, :team_id, :integer
  	add_column :scoretables, :match_id, :integer

  end
end
