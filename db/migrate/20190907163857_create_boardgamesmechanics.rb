class CreateBoardgamesmechanics < ActiveRecord::Migration[5.2]
  def change
    create_table :boardgamesmechanics do |t|
      t.references :boardgame, foreign_key: true
      t.references :mechanic, foreign_key: true

      t.timestamps
    end
  end
end
