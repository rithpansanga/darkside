class AddStatToSquads < ActiveRecord::Migration[5.0]
  def change
     add_column :squads, :goal, :integer
     add_column :squads, :gpm, :float
     add_column :squads, :assist, :integer
     add_column :squads, :tackle, :integer
     add_column :squads, :blockshot, :integer
     add_column :squads, :interception, :integer
     add_column :squads, :clearance, :integer
  end
end
