class AddViewsToBoardgames < ActiveRecord::Migration[5.2]
  def change
    add_column :boardgames, :view, :integer, default: 0
  end
end
