class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :url
      t.string :title
      t.string :channel_name
      t.string :thumb_url
      t.string :image_url
      t.string :bga_id
      t.references :boardgame, foreign_key: true

      t.timestamps
    end
  end
end
