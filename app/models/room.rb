class Room < ApplicationRecord
  belongs_to :young_user
  belongs_to :senior_user
  has_many :messages, dependent: :destroy
end
