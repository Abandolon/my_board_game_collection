class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :url
      t.string :thumb
      t.string :bga_id
      t.string :small
      t.string :medium
      t.string :large
      t.string :original
      t.references :boardgame, foreign_key: true

      t.timestamps
    end
  end
end
