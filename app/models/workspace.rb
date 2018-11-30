class Workspace < ApplicationRecord
  belongs_to :user

  has_many :reviews

  mount_uploader :photo, PhotoUploader

  def smoke_free?
    smoke_free
  end
end
