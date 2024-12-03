class Room < ApplicationRecord
  belongs_to :young_user
  belongs_to :senior_user
  belongs_to :noritu_favorite
  has_many :messages, dependent: :destroy
end
