class Usersboardgame < ApplicationRecord
  belongs_to :boardgame
  belongs_to :user

  validates_uniqueness_of :boardgame_id, scope: :user_id, message: "You've already added this game"
end
