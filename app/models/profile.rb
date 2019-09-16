class Profile < ApplicationRecord
  belongs_to :user

  mount_uploader :image, PhotoUploader
end
