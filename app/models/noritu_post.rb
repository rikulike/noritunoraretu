class NorituPost < ApplicationRecord
  belongs_to :senior_user
  has_many :noritu_favorites, dependent: :destroy
  has_many :young_users, through: :noritu_favorites
  validates :title, presence: true
  validates :body, presence: true
  validates :datetime, presence: true
  validates :current_location, presence: true
  validates :destination, presence: true
  
  
  def favorited_by?(young_user)
    noritu_favorites.exists?(young_user_id: young_user.id)
  end 
  
end
