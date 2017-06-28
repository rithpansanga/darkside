class AddTeamIdToScoretables < ActiveRecord::Migration[5.0]
  def change


  	 add_column :scoretables, :team_id, :integer
  end
end
