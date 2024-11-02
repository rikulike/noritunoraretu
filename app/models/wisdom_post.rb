class WisdomPost < ApplicationRecord
  belongs_to :young_user

  validates :title, presence: true
  validates :body, presence: true
end
