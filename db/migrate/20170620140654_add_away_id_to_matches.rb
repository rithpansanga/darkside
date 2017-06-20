class AddAwayIdToMatches < ActiveRecord::Migration[5.0]
  def change
     add_column :matches, :away_id, :integer
  end
end
