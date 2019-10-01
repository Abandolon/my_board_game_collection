class Profile < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged
  belongs_to :user
  validates :username, uniqueness: true

  mount_uploader :image, PhotoUploader
end
