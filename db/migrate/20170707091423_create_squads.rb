class CreateSquads < ActiveRecord::Migration[5.0]
  def change
    create_table :squads do |t|
      t.string :name
      t.string :position
      t.integer :team_id
    end
  end
end
