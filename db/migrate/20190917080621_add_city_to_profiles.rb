class AddCityToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :city, :string
    add_column :profiles, :country, :string
  end
end
