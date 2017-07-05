class ChangeInRecords < ActiveRecord::Migration[5.0]
  def change
    remove_column :records, :home
    remove_column :records, :away
    add_column :records, :home_id, :integer
    add_column :records, :away_id, :integer
  end
end
