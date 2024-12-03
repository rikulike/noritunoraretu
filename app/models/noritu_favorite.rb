class NorituFavorite < ApplicationRecord
  belongs_to :young_user
  belongs_to :noritu_post
  has_one :room
  
  validates :young_user_id, uniqueness: {scope: :noritu_post_id}
end
