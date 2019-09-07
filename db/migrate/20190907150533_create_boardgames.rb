class CreateBoardgames < ActiveRecord::Migration[5.2]
  def change
    create_table :boardgames do |t|
      t.string :name
      t.integer :year_published
      t.integer :min_players
      t.integer :max_players
      t.integer :min_playtime
      t.integer :max_playtime
      t.integer :min_age
      t.text :description
      t.string :desc_short
      t.string :img_url
      t.string :thumb_url
      t.string :url

      t.timestamps
    end
  end
end
