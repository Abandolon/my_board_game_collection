class Boardgamescategory < ApplicationRecord
  belongs_to :boardgame
  belongs_to :category
end
