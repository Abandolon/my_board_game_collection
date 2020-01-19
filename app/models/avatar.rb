class Avatar < ApplicationRecord
  mount_uploader :image, PhotoUploader
end
