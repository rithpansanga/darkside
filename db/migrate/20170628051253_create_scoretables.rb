class CreateScoretables < ActiveRecord::Migration[5.0]
  def change
    create_table :scoretables do |t|

    	t.integer :point
    end
  end
end
