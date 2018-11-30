class Review < ApplicationRecord
  belongs_to :workspace

  mount_uploader :photo, PhotoUploader
end
