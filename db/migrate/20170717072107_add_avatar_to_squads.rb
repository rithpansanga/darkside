class AddAvatarToSquads < ActiveRecord::Migration[5.0]
  def change
    add_column :squads, :avatar, :string
  end
end
