class CreateAways < ActiveRecord::Migration[5.0]
  def change
    create_table :aways do |t|
      t.string :stadium
    end
  end
end
