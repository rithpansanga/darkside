class AddEverythingToScoretables < ActiveRecord::Migration[5.0]
  def change
    add_column :scoretables, :won, :integer
    add_column :scoretables, :drawn, :integer
    add_column :scoretables, :lost, :integer
    add_column :scoretables, :gf, :integer
    add_column :scoretables, :ga, :integer
    add_column :scoretables, :gd, :integer

  end
end
