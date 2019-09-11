class CreateUsersboardgames < ActiveRecord::Migration[5.2]
  def change
    create_table :usersboardgames do |t|
      t.references :boardgame, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
