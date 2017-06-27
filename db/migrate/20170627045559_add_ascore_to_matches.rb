class AddAscoreToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :ascore, :integer
  end
end
