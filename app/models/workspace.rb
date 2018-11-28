class Workspace < ApplicationRecord
  belongs_to :user

  def smoke_free?
    smoke_free
  end
end
