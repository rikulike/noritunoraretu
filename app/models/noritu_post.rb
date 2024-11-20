class NorituPost < ApplicationRecord
  belongs_to :senior_user
  validates :title, presence: true
  validates :body, presence: true
  validates :datetime, presence: true
  validates :current_location, presence: true
  validates :destination, presence: true
end
