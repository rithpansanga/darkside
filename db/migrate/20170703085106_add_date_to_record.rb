class AddDateToRecord < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :date, :string
  end
end
