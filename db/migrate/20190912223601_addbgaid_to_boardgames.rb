class AddbgaidToBoardgames < ActiveRecord::Migration[5.2]
  def change
    add_column :boardgames, :bga_id, :string
  end
end
