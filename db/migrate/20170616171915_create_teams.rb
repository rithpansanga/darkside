class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t| # asd
      t.string :name
      t.string :coach
      t.timestamps
      
    end
  end
end
