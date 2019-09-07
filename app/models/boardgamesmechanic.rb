class Boardgamesmechanic < ApplicationRecord
  belongs_to :boardgame
  belongs_to :mechanic
end
