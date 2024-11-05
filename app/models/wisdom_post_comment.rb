class WisdomPostComment < ApplicationRecord
  belongs_to :young_user
  belongs_to :wisdom_post
end
