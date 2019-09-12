class AddColumnsToUsersboardgames < ActiveRecord::Migration[5.2]
  def change
    add_column :usersboardgames, :favorite, :boolean, default: false
    add_column :usersboardgames, :play_count, :int
  end
end
