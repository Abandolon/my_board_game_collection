class Mechanic < ApplicationRecord
  has_many :boardgamesmechanics
  has_many :boardgames, through: :boardgamesmechanics
end
