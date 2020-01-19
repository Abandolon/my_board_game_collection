class Profile < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged
  belongs_to :user
  has_one :avatars
  validates :username, uniqueness: true
end
