class WisdomPostComment < ApplicationRecord
  belongs_to :young_user
  belongs_to :wisdom_post

  validates :comment, presence: true
end
