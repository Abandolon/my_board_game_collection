class CreateBoardgamescategories < ActiveRecord::Migration[5.2]
  def change
    create_table :boardgamescategories do |t|
      t.references :boardgame, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
