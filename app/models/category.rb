class Category < ApplicationRecord
  has_many :boardgamescategories
  has_many :boardgames, through: :boardgamescategories
end
