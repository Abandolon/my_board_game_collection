class Boardgame < ApplicationRecord
  has_many :boardgamesmechanics, dependent: :destroy
  has_many :boardgamescategories, dependent: :destroy
  has_many :categories, through: :boardgamescategories
  has_many :mechanics, through: :boardgamesmechanics
end
