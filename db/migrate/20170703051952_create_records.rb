class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.string :home
      t.string :away
      t.string :hscore
      t.integer :ascore
    end
  end
end
