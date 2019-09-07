class Boardgame < ApplicationRecord
  has_many :boardgamesmechanics
  has_many :boardgamescategories
  has_many :categories, through: :boardgamescategories
  has_many :mechanics, through: :boardgamesmechanics
end
