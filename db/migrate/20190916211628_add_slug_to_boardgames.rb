class AddSlugToBoardgames < ActiveRecord::Migration[5.2]
  def change
    add_column :boardgames, :slug, :string
    add_index :boardgames, :slug, unique: true
  end
end
