class Workspace < ApplicationRecord
  belongs_to :user

  has_many :reviews

  def smoke_free?
    smoke_free
  end
end
