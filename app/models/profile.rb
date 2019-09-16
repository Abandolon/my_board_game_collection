class Profile < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged
  belongs_to :user
  mount_uploader :image, PhotoUploader
end
