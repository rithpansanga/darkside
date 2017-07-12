class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.datetime :create_at 
      t.datetime :update_at

    end
  end
end
