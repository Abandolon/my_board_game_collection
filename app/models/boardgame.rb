class Boardgame < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :boardgamesmechanics, dependent: :destroy
  has_many :boardgamescategories, dependent: :destroy
  has_many :categories, through: :boardgamescategories
  has_many :mechanics, through: :boardgamesmechanics
  has_many :usersboardgames, dependent: :destroy
  has_many :users, through: :usersboardgames
  has_many :images, dependent: :destroy
  has_many :videos, dependent: :destroy
end
